import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/leave_data.dart';
import 'package:smart_school/providers/apply_leave_provider.dart';
import 'package:smart_school/templates/leave_data.dart';

class ApplyLeave extends StatefulWidget {
  final List<LeaveData> leavedata;

  const ApplyLeave({this.leavedata});
  @override
  _ApplyLeaveState createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  DateTime _fromdate;
  DateTime _todate;
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => Container(
                alignment: Alignment.center,
                height: 800.0,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Form(
                        child: Column(
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
                                              _fromdate == null? 'From Date' :_fromdate.toString().substring(0,10),
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    RaisedButton(
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
                                              _todate == null? 'To Date' :_todate.toString().substring(0, 10),
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    RaisedButton(
                                        child: Text('From date'),
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
                          ],
                        )
                    ),
                    RaisedButton(
                        child: Text('Submit'),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                Provider.of<ApplyLeaveProvider>(context, listen: false)
                                    .saveLeave(_fromdate, _todate, textEditingController.text),
                            ),
                          );
                        }
                    )
                  ],
                )
          ),
        ),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount: widget.leavedata.length-1??0,
          itemBuilder: (context, index) {
            // final homeworkData = homework[index];
            return LeaveDataCard(leavedata: widget.leavedata[index]);
          }
      ),
    );
  }
}