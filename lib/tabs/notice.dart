import 'package:flutter/material.dart';
import 'package:smart_school/modal/notice.dart';
import 'package:smart_school/templates/notice.dart';

class NoticeTab extends StatefulWidget {
  final List<NoticeData> noticedata;

  const NoticeTab({this.noticedata});
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
          child: 1 == widget.noticedata.length ?
          Card(
            child: Center(
                child: Text(
                  "No notice available",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0
                  ),
                )
            ),
          )
          : ListView.builder(
              itemCount: widget.noticedata.length-1??0,
              itemBuilder: (context, index) {
                return NoticeCard(noticedata: widget.noticedata[index]);
              }
          ),
        )
    );
  }
}


