import 'package:flutter/material.dart';
import 'package:smart_school/modal/attendance.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  final AttendanceData attendance;

  const Calender({this.attendance});
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> with TickerProviderStateMixin {
  CalendarController _controller = CalendarController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: TableCalendar(
        rowHeight: 49.0,
        calendarController: _controller,

      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}