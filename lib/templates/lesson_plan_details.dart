import 'package:flutter/material.dart';

class LessonPlanDetails extends StatefulWidget {
  @override
  _LessonPlanDetailsState createState() => _LessonPlanDetailsState();
}

class _LessonPlanDetailsState extends State<LessonPlanDetails> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            title: Text(
             'Lessons Number',
              style: TextStyle(color: Colors.black),
            ),
            children: [
              for(int i=0;i<3;i++)
                  ListTile(
                    title: Text(
                      'subtopics',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
            ],
          );
        }
    );
  }
}
