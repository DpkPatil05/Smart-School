import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/lesson_plan.dart';
import 'package:smart_school/providers/lesson_plan_provider.dart';
import 'package:smart_school/tabs/hamItems/lesson_plan.dart';

class FetchLessonPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<LessonPlanData>>.value(
      value: null,
      child: FutureBuilder<List<LessonPlanData>>(
        future: LessonPlanProvider().fetchLessonPlan(),
        builder: (BuildContext context, AsyncSnapshot<List<LessonPlanData>> lessonPlanData) {
          switch (lessonPlanData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return lessonPlanData.hasError? Text('Error: ${lessonPlanData.error}')
                  : LessonPlan(lessonplandata: lessonPlanData.data);
          }
        },
      ),
    );
  }
}