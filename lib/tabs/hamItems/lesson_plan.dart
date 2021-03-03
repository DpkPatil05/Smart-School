import 'package:flutter/material.dart';
import 'package:smart_school/modal/lesson_plan.dart';
import 'package:smart_school/utils/lesson_plan_calender.dart';

class LessonPlan extends StatefulWidget {
  final List<LessonPlanData> lessonplandata;

  const LessonPlan({this.lessonplandata});
  @override
  _LessonPlanState createState() => _LessonPlanState();
}

class _LessonPlanState extends State<LessonPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Card(
                child: LessonPlanCalender(lessonplan: widget.lessonplandata)
              )
          ),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Center(child: Text(
                  'Select date to see the lesson plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0
                  ),
                )),
              )
          ),
        ],
      )
    );
  }
}
