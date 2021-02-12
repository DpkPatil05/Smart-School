import 'package:flutter/material.dart';

class DownloadCenter extends StatefulWidget {
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
                      itemCount: 1,
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
                                  Text('Assignment 1'),
                                  IconButton(
                                      icon: Icon(Icons.file_download),
                                      onPressed: (){}
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
                      itemCount: 1,
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
                                    Text('Study material 1'),
                                    IconButton(
                                        icon: Icon(Icons.file_download),
                                        onPressed: (){}
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
                      itemCount: 1,
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
                                    Text('Syllabus1'),
                                    IconButton(
                                        icon: Icon(Icons.file_download),
                                        onPressed: (){}
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
                      itemCount: 1,
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
                                    Text('others'),
                                    IconButton(
                                        icon: Icon(Icons.file_download),
                                        onPressed: (){}
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
