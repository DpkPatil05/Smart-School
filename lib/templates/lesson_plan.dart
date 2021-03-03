import 'package:flutter/material.dart';
import 'package:smart_school/modal/lesson_plan.dart';

class LessonPlanCard extends StatefulWidget {
  final LessonPlanData lessonplan;

  const LessonPlanCard({this.lessonplan});
  @override
  _LessonPlanCardState createState() => _LessonPlanCardState();
}

class _LessonPlanCardState extends State<LessonPlanCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column()
    );
  }
}
