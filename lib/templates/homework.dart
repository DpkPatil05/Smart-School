import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/homework.dart';
import 'package:smart_school/providers/homework_provider.dart';
import 'package:smart_school/services/check_permissions.dart';
import 'package:smart_school/services/download.dart';

class HomeworkCard extends StatefulWidget {
  final HomeworkData hwdata;

  const HomeworkCard({this.hwdata});
  @override
  _HomeworkCardState createState() => _HomeworkCardState();
}

class _HomeworkCardState extends State<HomeworkCard> {
  bool downloadingContent = false;

  String progress = '';

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
  void initState() {
    super.initState();
    setState(() {
      downloadingContent = Provider.of<Download>(context, listen: false).downloading;
      progress = Provider.of<Download>(context, listen: false).progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      downloadingContent = Provider.of<Download>(context, listen: true).downloading;
      progress = Provider.of<Download>(context, listen: true).progress;
      print(progress);
    });
    return ChangeNotifierProvider(
      create: (context) => Download(),
      child: Consumer<Download>(
          builder: (BuildContext context, data, _) {
            return downloadingContent ? Center(
              child: Container(
                height: 120.0,
                width: 200.0,
                child: Card(
                  color: Colors.white70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 10.0),
                      Text("Downloading $progress")
                    ],
                  ),
                ),
              ),
            ) : Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.hwdata.subject}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  onPressed: () => showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) => Container(
                                        alignment: Alignment.center,
                                        height: 400.0,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(height: 30.0),
                                              Container(
                                                color: Colors.red,
                                                height: 150.0,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Center(
                                                      child: Text('Select homework file to upload',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(Icons.photo_camera,
                                                            size: 57.0,
                                                            color: Colors.white
                                                          ),
                                                          onPressed: () async => _pickImageFromCamera(),
                                                          tooltip: 'Shoot picture',
                                                        ),
                                                        IconButton(
                                                          icon: Icon(Icons.photo,
                                                            size: 57.0,
                                                            color: Colors.white
                                                          ),
                                                          onPressed: () async => _pickImageFromGallery(),
                                                          tooltip: 'Pick from gallery',
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 30.0),
                                                    Center(
                                                      child: FlatButton(
                                                        color: Colors.white,
                                                        onPressed: (){},
                                                        child: Text('Submit',
                                                          style: TextStyle(
                                                            color: Colors.black87,
                                                            fontWeight: FontWeight.bold,
                                                          )),
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                                      )
                                  ),
                                  child: Icon(Icons.upload_file),
                                ),
                                FlatButton(
                                  onPressed: () => showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) => Container(
                                        alignment: Alignment.center,
                                        height: 300.0,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(height: 10.0),
                                            Text(
                                                '${HomeworkProvider().getDescription(widget.hwdata.description)}',
                                                textAlign: TextAlign.center
                                            ),
                                            Container(
                                              color: Colors.green,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  FlatButton(
                                                      onPressed: () {
                                                        CheckPermissions().checkStoragePermission().then((value) =>
                                                            HomeworkProvider().generateDownload(widget.hwdata.doc)
                                                        );
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Text("Attachment",
                                                              style: TextStyle(color: Colors.white)),
                                                          SizedBox(width: 5.0),
                                                          Icon(
                                                            Icons.download_rounded,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      )
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                  child: Icon(Icons.preview_outlined),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "${widget.hwdata.completion}",
                                style: TextStyle(
                                    color: "Complete" == widget.hwdata.completion ?
                                    Colors.green : Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                )
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Table(
                          children: [
                            TableRow(children: [
                              Text(
                                'Homework Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('${widget.hwdata.hwdate}'),
                            ]),
                            TableRow(children: [
                              Text(
                                'Submission Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('${widget.hwdata.submitdate}'),
                            ]),
                            TableRow(children: [
                              Text(
                                'Evaluation Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('${widget.hwdata.evaldate}'),
                            ]),
                            TableRow(children: [
                              Text(
                                'Evaluated By',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('${widget.hwdata.evalby}'),
                            ])
                          ],
                        ),
                      ]
                  ),
                )
            );
          }
      ),
    );
  }
}