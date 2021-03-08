import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/notice.dart';
import 'package:smart_school/providers/notice_provider.dart';

class NoticeCard extends StatefulWidget {
  final NoticeData noticedata;

  const NoticeCard({this.noticedata});
  @override
  _NoticeCardState createState() => _NoticeCardState();
}

class _NoticeCardState extends State<NoticeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                SizedBox(
                  width: 150.0,
                  child: Text(
                    '${widget.noticedata.title}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text('${widget.noticedata.date}'),
                IconButton(
                  iconSize: 20.0,
                  icon: Icon(Icons.preview_outlined),
                  tooltip: "View Details",
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => Container(
                        alignment: Alignment.center,
                        height: 300.0,
                        child: Text(
                            '${Provider.of<NoticeProvider>(context, listen: false)
                            .noticeMessage(widget.noticedata.msg)}',
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                ),
              ]
          ),
        )
    );
  }
}