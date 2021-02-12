import 'package:flutter/material.dart';
import 'package:smart_school/modal/timetable.dart';
import 'package:smart_school/templates/timetable.dart';

class ClassTimeTable extends StatefulWidget {
  final List<List<TimetableData>> timetabledata;

  const ClassTimeTable({this.timetabledata});
  @override
  _ClassTimeTableState createState() => _ClassTimeTableState();
}

class _ClassTimeTableState extends State<ClassTimeTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: widget.timetabledata.length??0,
          itemBuilder: (context, index) {
            return TimetableCard(timetabledata: widget.timetabledata[index]);
          }
      ),
    );
  }
}

