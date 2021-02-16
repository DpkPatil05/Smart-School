import 'package:flutter/material.dart';
import 'package:smart_school/modal/syllabus.dart';
import 'package:smart_school/templates/syllabus.dart';

class SyllabusStatus extends StatefulWidget {
  final List<SyllabusData> syllabus;

  const SyllabusStatus({this.syllabus});
  @override
  _SyllabusStatusState createState() => _SyllabusStatusState();
}

class _SyllabusStatusState extends State<SyllabusStatus> {
  @override
  Widget build(BuildContext context) {
    return 1 == widget.syllabus.length ?
    Card(
      child: Center(
          child: Text(
            "No Syllabus available",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0
            ),
          )
      ),
    ):ListView.builder(
      itemCount: widget.syllabus.length-1??0,
      itemBuilder: (BuildContext context, int index) {
        return SyllabusCard(syllabus: widget.syllabus[index]);
      },
    );
  }
}
