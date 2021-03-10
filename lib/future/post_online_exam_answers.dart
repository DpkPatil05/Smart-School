import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/future/fetch_online_exam.dart';
import 'package:smart_school/modal/online_exam_submit_response.dart';
import 'package:smart_school/providers/online_exam_provider.dart';

class PostAnswers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<OnlineExamSubmitResponse>.value(
      value: null,
      child: FutureBuilder<OnlineExamSubmitResponse>(
        future: OnlineExamProvider().submitAnswers(),
        builder: (BuildContext context, AsyncSnapshot<OnlineExamSubmitResponse> submitData) {
          switch (submitData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return submitData.hasError? Text('Error: ${submitData.error}')
                  : FetchOnlineExam();
          }
        },
      ),
    );
  }
}
