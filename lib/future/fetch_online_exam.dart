import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/online_exam.dart';
import 'package:smart_school/providers/online_exam_provider.dart';
import 'package:smart_school/tabs/hamItems/online_exam.dart';

class FetchOnlineExam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<OnlineExamData>>.value(
      value: null,
      child: FutureBuilder<List<OnlineExamData>>(
        future: OnlineExamProvider().fetchOnlineExam(),
        builder: (BuildContext context, AsyncSnapshot<List<OnlineExamData>> olExamData) {
          switch (olExamData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return olExamData.hasError? Text('Error: ${olExamData.error}')
                  : OnlineExam(onlineexamdata: olExamData.data);
          }
        },
      ),
    );
  }
}