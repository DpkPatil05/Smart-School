import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:smart_school/modal/lesson_plan.dart';
import 'package:smart_school/providers/lesson_plan_provider.dart';

class LessonPlanCalender extends StatefulWidget {
  final List<LessonPlanData> lessonplan;
  const LessonPlanCalender({this.lessonplan});
  @override
  _LessonPlanCalenderState createState() => _LessonPlanCalenderState();
}

class _LessonPlanCalenderState extends State<LessonPlanCalender> with TickerProviderStateMixin {

  DateTime _currentDate = DateTime.now();
  DateTime _targetDateTime = DateTime.now();
  EventList<Event> _markedDateMap = EventList<Event>(events: {});

  CalendarCarousel _calendarCarousel;

  @override
  void initState() {
    for(final lessonPlan in widget.lessonplan) {
      var year = int.parse(lessonPlan.date.substring(0, 4));
      var month = int.parse(lessonPlan.date.substring(5, 7));
      var day = int.parse(lessonPlan.date.substring(8, 10));
      var date= DateTime(year, month, day);

      _markedDateMap.add(date, Event(
        date: date,
        /*icon: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text('${date.day}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),*/
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarousel = CalendarCarousel<Event>(
      todayBorderColor: Colors.blue,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) =>
            0 == LessonPlanProvider().getCount(widget.lessonplan, date) ?
            ListTile(title: Center(child: Text('No Data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              ),
            )))
            : ListView.builder(
            itemCount: LessonPlanProvider().getCount(widget.lessonplan, date),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Test'),
              );
            })
        ));
      },
      // daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: true,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 450.0,
      selectedDateTime: _currentDate,
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
          /*Provider.of<LessonPlanProvider>(context, listen: false)
              .dateChangeEvent(date, widget.attendance);*/
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Scaffold(body: _calendarCarousel);
  }
}