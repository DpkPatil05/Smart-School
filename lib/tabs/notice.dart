import 'package:flutter/material.dart';

class NoticeTab extends StatefulWidget {
  @override
  _NoticeTabState createState() => _NoticeTabState();
}

class _NoticeTabState extends State<NoticeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text(
                              'Notice',
                              style: TextStyle(
                                fontSize: 30.0
                              ),
                            ),
                            Text(
                              'Date'
                            ),
                            Container(
                              height: 30.0,
                              child: IconButton(
                                iconSize: 20.0,
                                icon: Icon(Icons.preview_outlined),
                                tooltip: "View Details",
                                onPressed: () => showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) => Container(
                                    alignment: Alignment.center,
                                    height: 300.0,
                                    child: Text('Details about the Notice'),
                                  )
                                ),
                                // child: const Text('View'),
                              ),
                            ),
                          ]
                      ),
                    )
                );
              }
          ),
        )
    );
  }
}
