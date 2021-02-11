import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: TableCalendar(
          rowHeight: 40.0,
          calendarController: _controller),
    );
  }
}