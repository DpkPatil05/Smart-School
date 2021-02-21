import 'package:flutter/material.dart';
import 'package:smart_school/modal/download_center.dart';
import 'package:smart_school/providers/download_center_provider.dart';
import 'package:smart_school/services/check_permissions.dart';

class DownloadCenter extends StatefulWidget {
  final List<List<DownloadCenterData>> downloadcenterdata;

  const DownloadCenter({this.downloadcenterdata});
  @override
  _DownloadCenterState createState() => _DownloadCenterState();
}

class _DownloadCenterState extends State<DownloadCenter> with SingleTickerProviderStateMixin{
TabController _controller;

@override
void initState() {
  super.initState();
  _controller = TabController(length: 4, vsync: this);
}
  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.red),
          child: TabBar(
            controller: _controller,
            tabs: [
              Tab(
                text: 'Assignments',
              ),
              Tab(
                text: 'Study Material',
              ),
              Tab(
                text: 'Syllabus',
              ),
              Tab(
                text: 'Others',
              ),
            ],
          ),
        ),
        Container(
          height: 400.0,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                Container(
                  child: ListView.builder(
                      itemCount: widget.downloadcenterdata[0]?.length??0,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 230.0,
                                    child: Text('${widget.downloadcenterdata[0][index].title}')
                                  ),
                                  Text('${widget.downloadcenterdata[0][index].date}'),
                                  IconButton(
                                      icon: Icon(Icons.file_download),
                                      onPressed: (){
                                        CheckPermissions().checkStoragePermission().then((value) =>
                                            DownloadCenterProvider().generateDownload(widget.downloadcenterdata[0][index].link));
                                      }
                                  )
                                ],
                              )
                            )
                        );
                      }
                  ),
                ),
                Container(
                  child: ListView.builder(
                      itemCount: widget.downloadcenterdata[1]?.length??0,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 230.0,
                                      child: Text('${widget.downloadcenterdata[1][index].title}')
                                    ),
                                    Text('${widget.downloadcenterdata[1][index].date}'),
                                    IconButton(
                                        icon: Icon(Icons.file_download),
                                        onPressed: (){
                                          CheckPermissions().checkStoragePermission().then((value) =>
                                              DownloadCenterProvider().generateDownload(widget.downloadcenterdata[1][index].link));
                                        }
                                    )
                                  ],
                                )
                            )
                        );
                      }
                  ),
                ),
                Container(
                  child: ListView.builder(
                      itemCount: widget.downloadcenterdata[2]?.length??0,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 230.0,
                                      child: Text('${widget.downloadcenterdata[2][index].title}')
                                    ),
                                    Text('${widget.downloadcenterdata[2][index].date}'),
                                    IconButton(
                                        icon: Icon(Icons.file_download),
                                        onPressed: (){
                                          CheckPermissions().checkStoragePermission().then((value) =>
                                              DownloadCenterProvider().generateDownload(widget.downloadcenterdata[2][index].link));
                                        }
                                    )
                                  ],
                                )
                            )
                        );
                      }
                  ),
                ),
                Container(
                  child: ListView.builder(
                      itemCount: widget.downloadcenterdata[3]?.length??0,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 230.0,
                                      child: Text('${widget.downloadcenterdata[3][index].title}')
                                    ),
                                    Text('${widget.downloadcenterdata[3][index].date}'),
                                    IconButton(
                                        icon: Icon(Icons.file_download),
                                        onPressed: (){
                                          CheckPermissions().checkStoragePermission().then((value) =>
                                              DownloadCenterProvider().generateDownload(widget.downloadcenterdata[3][index].link));
                                        }
                                    )
                                  ],
                                )
                            )
                        );
                      }
                  ),
                ),
              ],
            )
        )
      ],
    );
  }
}
