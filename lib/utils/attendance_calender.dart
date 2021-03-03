import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/attendance.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:smart_school/providers/attendance_provider.dart';

class AttendanceCalender extends StatefulWidget {
  final AttendanceData attendance;
  const AttendanceCalender({this.attendance});
  @override
  _AttendanceCalenderState createState() => _AttendanceCalenderState();
}

class _AttendanceCalenderState extends State<AttendanceCalender> with TickerProviderStateMixin {

  DateTime _currentDate2 = DateTime.now();
  DateTime _targetDateTime = DateTime.now();
  EventList<Event> _markedDateMap = EventList<Event>(events: {});

  CalendarCarousel _calendarCarousel;

  @override
  void initState() {
    for(final d in widget.attendance.attendence.attendancearray) {
      var year = int.parse(d[2]);
      var month = int.parse(d[1]);
      var day = int.parse(d[0]);
      var date= DateTime(year, month, day);

      'green' == d[5].toString()?
      _markedDateMap.add(date, Event(
        date: date,
        title: 'Present',
        icon: CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(
            '${date.day}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      )):
      '#FFFF00' == d[5].toString()?
      _markedDateMap.add(date, Event(
        date: date,
        title: 'Late',
        icon: CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Text(
            '${date.day}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      )):
      '#FF8C00' == d[5].toString()?
      _markedDateMap.add(date, Event(
        date: date,
        title: 'Half Day',
        icon: CircleAvatar(
          backgroundColor: Colors.orange,
          child: Text(
            '${date.day}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      )):
      '#800000' == d[5]?
      _markedDateMap.add(date, Event(
        date: date,
        title: 'Absent',
        icon: CircleAvatar(
          backgroundColor: Colors.red,
          child: Text(
            '${date.day}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      )):
      _markedDateMap.add(date, Event(
        date: date,
        title: 'Holiday',
        icon: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Text(
            '${date.day}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarousel = CalendarCarousel<Event>(
      todayBorderColor: Colors.blue,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Attendance'),
                content: Text('${event.title}'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: (){
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              );
            })
        );
      },
      // daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 450.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateIconBuilder: (event) => event.icon,
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      todayButtonColor: Colors.yellow,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.pinkAccent,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          Provider.of<AttendanceProvider>(context, listen: false)
              .dateChangeEvent(date, widget.attendance);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Scaffold(body: _calendarCarousel);
  }
}