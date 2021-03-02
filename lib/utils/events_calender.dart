import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:smart_school/modal/calender_events.dart';
import 'package:smart_school/utils/months_in_number.dart';

class EventsCalender extends StatefulWidget {
  final List<EventData> eventsdata;
  const EventsCalender({this.eventsdata});
  @override
  _EventsCalenderState createState() => _EventsCalenderState();
}

class _EventsCalenderState extends State<EventsCalender> with TickerProviderStateMixin {

  DateTime _currentDate2 = DateTime.now();
  DateTime _targetDateTime = DateTime.now();
  EventList<Event> _markedDateMap = EventList<Event>(events: {});

  CalendarCarousel _calendarCarousel;

  @override
  void initState() {
    for (final data in widget.eventsdata) {
      var year = int.parse(data.startdate.substring(8, 12));
      var month = MonthsToNumber().monthsInYear[data.startdate.substring(3, 6)];
      var day = int.parse(data.startdate.substring(0, 2));
      var date = DateTime(year, month, day);

      var _endyear = int.parse(data.enddate.substring(8, 12));
      var _endmonth = MonthsToNumber().monthsInYear[data.enddate.substring(3, 6)];
      var _endday = int.parse(data.enddate.substring(0, 2));
      var _enddate = DateTime(_endyear, _endmonth, _endday);

      _markedDateMap.add(date, Event(
        date: _enddate,
        title: '${data.title}',
        icon: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text('${date.day}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ));

      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarousel = CalendarCarousel<Event>(
      todayBorderColor: Colors.blue,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => SingleChildScrollView(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 30.0),
                    Center(
                      child: SizedBox(
                        width: 390.0,
                        child: Text(
                          '${event.title}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Center(
                      child: Text(
                        'End Date: ${event.date.day}/${event.date.month}/${event.date.year}',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      )
                    ),
                    SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
        ));
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
      markedDateIconBuilder: (event) {
        return event.icon;
      },
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
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return  Scaffold(body: _calendarCarousel);
  }
}
