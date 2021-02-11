import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/exam.dart';
import 'package:smart_school/providers/exam_provider.dart';
import 'package:smart_school/tabs/examination.dart';

class FetchExam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Exam>>.value(
      value: null,
      child: FutureBuilder<List<Exam>>(
        future: ExamProvider().fetchExam(),
        builder: (BuildContext context, AsyncSnapshot<List<Exam>> examData) {
          switch (examData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return examData.hasError? Text('Error: ${examData.error}')
                  : ExaminationTab(examdata: examData.data);
          }
        },
      ),
    );
  }
}