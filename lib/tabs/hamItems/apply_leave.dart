import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/leave_data.dart';
import 'package:smart_school/providers/apply_leave_provider.dart';
import 'package:smart_school/services/upload.dart';
import 'package:smart_school/templates/leave_data.dart';

class ApplyLeave extends StatefulWidget {
  final List<LeaveData> leavedata;

  const ApplyLeave({this.leavedata});
  @override
  _ApplyLeaveState createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  DateTime _fromdate, _todate;
  final textEditingController = TextEditingController();
  File _imageFile;
  final _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final PickedFile pickedFile =
    await _picker.getImage(source: ImageSource.gallery);
    setState(() => this._imageFile = File(pickedFile.path));
  }

  Future<void> _pickImageFromCamera() async {
    final PickedFile pickedFile =
    await _picker.getImage(source: ImageSource.camera);
    setState(() => this._imageFile = File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Form(child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_today),
                                          SizedBox(width: 10.0),
                                          Text(
                                            _fromdate == null? 'From Date'
                                                :_fromdate.toString().substring(0,10),
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  RaisedButton(
                                      color: Colors.white70,
                                      child: Text('From date'),
                                      onPressed: () {
                                        showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2050)
                                        ).then((date){
                                          setState(() {
                                            _fromdate = date;
                                          });
                                        });
                                      }
                                  )
                                ]
                              ),
                              TableRow(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_today),
                                          SizedBox(width: 10.0),
                                          Text(
                                            _todate == null? 'To Date'
                                                :_todate.toString().substring(0, 10),
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  RaisedButton(
                                    color: Colors.white70,
                                    child: Text('To date'),
                                    onPressed: () {
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2050)
                                      ).then((date){
                                        setState(() {
                                          _todate = date;
                                        });
                                      });
                                    }
                                  )
                                ]
                              ),
                            ],
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.notes),
                              hintText: 'Reason for leave',
                              labelText: 'Reason',
                            ),
                            controller: textEditingController,
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 45.0),
                                child: IconButton(
                                  icon: Icon(Icons.photo_camera, size: 57.0),
                                  onPressed: () async => _pickImageFromCamera(),
                                  tooltip: 'Shoot picture',
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.photo, size: 57.0),
                                onPressed: () async => _pickImageFromGallery(),
                                tooltip: 'Pick from gallery',
                              ),
                              SizedBox(width: 5.0)
                            ],
                          )
                        ]
                    )),
                    SizedBox(height: 35.0),
                    RaisedButton(
                        color: Colors.red,
                        child: Text('Submit',
                        style: TextStyle(color: Colors.white)),
                        onPressed: (){
                          var leaveProv = Provider.of<ApplyLeaveProvider>(context, listen: false);

                          Navigator.of(context).pop(false);

                          null == _imageFile ?
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Scaffold(
                                    appBar: AppBar(
                                      backgroundColor: Colors.red,
                                      title: Text('Apply Leave'),
                                    ),
                                    body: leaveProv
                                        .saveLeave(_fromdate, _todate, textEditingController.text),
                                  ),
                            ),
                          ) : Upload().upload(_imageFile).then(
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Scaffold(
                                        appBar: AppBar(
                                          backgroundColor: Colors.red,
                                          title: Text('Apply Leave'),
                                        ),
                                        body: leaveProv
                                            .saveLeave(_fromdate, _todate, textEditingController.text),
                                      ),
                                ),
                              )
                          );
                        }
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 750.0,
                      width: 750.0,
                      child: this._imageFile == null ?
                      SizedBox(height: 10.0) : Image.file(this._imageFile),
                    )
                  ],
                ),
              ),
        ),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: 1 == widget.leavedata.length ?
      Card(
        child: Center(
            child: Text(
              "No leaves applied, Press the '+' button to apply leave",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
              ),
            )
        ),
      ) : ListView.builder(
          itemCount: widget.leavedata.length-1??0,
          itemBuilder: (context, index) {
            return LeaveDataCard(leavedata: widget.leavedata[index]);
          }
      ),
    );
  }
}