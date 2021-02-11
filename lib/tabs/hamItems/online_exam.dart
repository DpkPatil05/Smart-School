import 'package:flutter/material.dart';
import 'package:smart_school/modal/online_exam.dart';
import 'package:smart_school/templates/online_exam.dart';

class OnlineExam extends StatefulWidget {
  final List<OnlineExamData> onlineexamdata;

  const OnlineExam({this.onlineexamdata});
  @override
  _OnlineExamState createState() => _OnlineExamState();
}

class _OnlineExamState extends State<OnlineExam> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: widget.onlineexamdata.length-1??0,
          itemBuilder: (context, index) {
            return OnlineExamCard(examdata: widget.onlineexamdata[index]);
          }
      ),
    );
  }
}

