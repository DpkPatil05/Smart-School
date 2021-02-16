import 'package:flutter/material.dart';
import 'package:smart_school/modal/lesson_plan.dart';
import 'package:smart_school/templates/lesson_plan.dart';

class LessonPlan extends StatefulWidget {
  final List<List<LessonPlanData>> lessonplandata;

  const LessonPlan({this.lessonplandata});
  @override
  _LessonPlanState createState() => _LessonPlanState();
}

class _LessonPlanState extends State<LessonPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: 1 == widget.lessonplandata.length ?
      Card(
        child: Center(
            child: Text(
              "No Lesson Plan available",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
              ),
            )
        ),
      ) :ListView.builder(
          itemCount: widget.lessonplandata.length??0,
          itemBuilder: (context, index) {
            return LessonPlanCard(lessonplan: widget.lessonplandata[index]);
          }
      ),
    );
  }
}
