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
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _controller = CalendarController();

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: TableCalendar(
        rowHeight: 50.0,
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