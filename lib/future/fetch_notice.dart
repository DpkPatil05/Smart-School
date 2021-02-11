import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/notice.dart';
import 'package:smart_school/providers/notice_provider.dart';
import 'package:smart_school/tabs/notice.dart';

class FetchNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<NoticeData>>.value(
      value: null,
      child: FutureBuilder<List<NoticeData>>(
        future: NoticeProvider().fetchNotice(),
        builder: (BuildContext context, AsyncSnapshot<List<NoticeData>> noticeData) {
          switch (noticeData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return noticeData.hasError? Text('Error: ${noticeData.error}')
                  : NoticeTab(noticedata: noticeData.data);
          }
        },
      ),
    );
  }
}