import 'package:flutter/material.dart';
import 'package:smart_school/templates/syllabus.dart';
import 'package:smart_school/modal/syllabus.dart';

class SyllabusStatus extends StatefulWidget {
  final List<SyllabusData> lessons, subjects, topics;

  const SyllabusStatus({this.lessons, this.subjects, this.topics});
  @override
  _SyllabusStatusState createState() => _SyllabusStatusState();
}

class _SyllabusStatusState extends State<SyllabusStatus> {
  @override
  Widget build(BuildContext context) {
    return 0 == widget.subjects.length ?
    Card(
      child: Center(
          child: Text(
            "Syllabus Status not available",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0
            ),
          )
      ),
    ) : ListView.builder(
      itemCount: widget.subjects?.length??0,
      itemBuilder: (BuildContext context, int index) {
        return SyllabusCard(subject: widget.subjects[index], lessons: widget.lessons, topics: widget.topics);
      },
    );
  }
}
