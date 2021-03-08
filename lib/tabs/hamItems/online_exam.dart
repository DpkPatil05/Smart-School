import 'package:flutter/material.dart';
import 'package:smart_school/modal/online_exam.dart';
import 'package:smart_school/templates/online_exam.dart';

class OnlineExam extends StatefulWidget {
  final List<List<OnlineExamData>> onlineexamdata;

  const OnlineExam({this.onlineexamdata});
  @override
  _OnlineExamState createState() => _OnlineExamState();
}

class _OnlineExamState extends State<OnlineExam> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: 0 == widget.onlineexamdata.length ?
      Card(
        child: Center(
            child: Text(
              "No Online Exam Data available",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
              ),
            )
        ),
      ) : ListView.builder(
          itemCount: widget.onlineexamdata.length??0,
          itemBuilder: (context, index) {
            return OnlineExamCard(examdata: widget.onlineexamdata[index]);
          }
      ),
    );
  }
}

