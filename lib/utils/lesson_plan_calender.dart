import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:provider/provider.dart';
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

      String subjectData = LessonPlanProvider().getLessonPlanData(lessonPlan);

      _markedDateMap.add(date, Event(
        date: date,
        title: subjectData,
        icon: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SizedBox(
            width: 5.0,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool imageData = false;
    Uint8List bytes;
    var lessonPlanProv = Provider.of<LessonPlanProvider>(context, listen: true);
    setState(() {
      imageData = lessonPlanProv.imageData;
      bytes = lessonPlanProv.bytes;
    });
    _calendarCarousel = CalendarCarousel<Event>(
      todayBorderColor: Colors.blue,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        return showModalBottomSheet(
            context: context,
            builder: (BuildContext context) =>
            0 == LessonPlanProvider().getCount(widget.lessonplan, date) ?
            ListTile(title: Center(child: Text(
              'No Data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              ),
            ))) : ListView.builder(
            itemCount: LessonPlanProvider().getCount(widget.lessonplan, date),
            itemBuilder: (context, index) {
              return ListTile(
                title: ExpansionTile(
                  title: SizedBox(
                    width: 300,
                    child: Text('${lessonPlanProv
                        .getTitleNPresentation(events[index].title, 'SUBJECTSPLTR', 0)}'),
                  ),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          title: Row(
                            children: [
                              Text('Time: ',
                                  style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                              SizedBox(
                                width: 300.0,
                                child: Text('${lessonPlanProv
                                    .getData(events[index].title, 'LESSONSPLTR', 'SUBJECTSPLTR')}'
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 2.0),
                        ListTile(
                          title: Row(
                            children: [
                              Text('Lesson: ',
                                  style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                              SizedBox(
                                width: 280.0,
                                child: Text('${lessonPlanProv
                                    .getData(events[index].title, 'TOPICSPLTR', 'LESSONSPLTR')}'
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 2.0),
                        ListTile(
                          title: Row(
                            children: [
                              Text('Topic: ',
                                  style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                              SizedBox(
                                width: 280.0,
                                child: Text('${lessonPlanProv
                                    .getData(events[index].title, 'SUBTOPICSPLTR', 'TOPICSPLTR')}'
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 2.0),
                        ListTile(
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Sub Topic:',
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 330.0,
                                    child: Text('${lessonPlanProv
                                        .getData(events[index].title, 'GENOBJECTIVESSPLTR', 'SUBTOPICSPLTR')}'
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 2.0),
                        ListTile(
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  Text('General Objective:',
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 330.0,
                                    child: Text('${lessonPlanProv
                                        .getData(events[index].title, 'TEACHINGMETHODSPLTR', 'GENOBJECTIVESSPLTR')}'
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 2.0),
                        ListTile(
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Teaching Method:',
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 330.0,
                                    child: Text('${lessonPlanProv
                                        .getData(events[index].title, 'PREVKNOWLEDGESPLTR', 'TEACHINGMETHODSPLTR')}'
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 2.0),
                        ListTile(
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Previous Knowledge:',
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 330.0,
                                    child: Text('${lessonPlanProv
                                        .getData(events[index].title, 'COMPREHENSIVEQUESTSPLTR', 'PREVKNOWLEDGESPLTR')}'
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 2.0),
                        ListTile(
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Comprehensive Questions:',
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 330.0,
                                    child: Text('${lessonPlanProv
                                        .getData(events[index].title, 'PRESENTATIONSPLTR', 'COMPREHENSIVEQUESTSPLTR')}'
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 2.0),
                        ListTile(
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Presentation:',
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 330.0,
                                    child: imageData ? Image.memory(bytes)
                                        : Text('${lessonPlanProv
                                        .getTitleNPresentation(events[index].title, 'PRESENTATIONSPLTR', 1)}'
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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