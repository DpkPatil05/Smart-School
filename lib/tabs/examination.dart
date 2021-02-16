import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/exam.dart';
import 'package:smart_school/modal/exam_result.dart';
import 'package:smart_school/modal/exam_schedule.dart';
import 'package:smart_school/providers/exam_provider.dart';
import 'package:smart_school/templates/exam.dart';

class ExaminationTab extends StatefulWidget {
  final List<Exam> examdata;

  const ExaminationTab({this.examdata});
  @override
  _ExaminationTabState createState() => _ExaminationTabState();
}

class _ExaminationTabState extends State<ExaminationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.white,
            child: 1 == widget.examdata.length ?
            Card(
              child: Center(
                  child: Text(
                    "No Exams available",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0
                    ),
                  )
              ),
            ) :ListView.builder(
                itemCount: widget.examdata.length-1??0,
                itemBuilder: (context, index) {
                  return StreamProvider<List<ExamSchedule>>.value(
                    value: null,
                    child: FutureBuilder<List<ExamSchedule>>(
                      future: ExamProvider().fetchExamSchedule(int.parse(widget.examdata[index].examId)),
                      builder: (BuildContext context, AsyncSnapshot<List<ExamSchedule>> examScheduleData) {
                        switch (examScheduleData.connectionState) {
                          case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
                          default:
                            return examScheduleData.hasError? Text('Error: ${examScheduleData.error}')
                                : StreamProvider<List<ExamResult>>.value(
                              value: null,
                              child: FutureBuilder<List<ExamResult>>(
                                future: ExamProvider().fetchExamResult(int.parse(widget.examdata[index].examId)),
                                builder: (BuildContext context, AsyncSnapshot<List<ExamResult>> examResultData) {
                                  switch (examResultData.connectionState) {
                                    case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
                                    default:
                                      return examResultData.hasError? Text('Error: ${examResultData.error}')
                                          : ExamCard(exam: widget.examdata[index].type, examscheduledata: examScheduleData.data, examresultdata: examResultData.data);
                                  }
                                },
                              ),
                            );
                        }
                      },
                    ),
                  );
                }
            ),
          )
      );
  }
}

