import 'package:flutter/material.dart';

class Homework extends StatefulWidget {
  @override
  _HomeworkState createState() => _HomeworkState();
}

List<List> homework = [
  ['English','Homework Date','06-01-2021','Submission Date','10-01-2021','Evaluation Date','10-01-2021','Created by Joe','Evaluated By Joe'],
  ['Science','Homework Date','06-01-2021','Submission Date','10-01-2021','Evaluation Date','10-01-2021','Created by Joe','Evaluated By Joe'],
  ['Maths','Homework Date','06-01-2021','Submission Date','10-01-2021','Evaluation Date','10-01-2021','Created by Joe','Evaluated By Joe'],
  ['Social Studies','Homework Date', '06-01-2021','Submission Date','10-01-2021','Evaluation Date', '10-01-2021','Created by Joe','Evaluated By Joe'],
  ['Science','Homework Date','06-01-2021','Submission Date','10-01-2021','Evaluation Date', '10-01-2021','Created by Joe','Evaluated By Joe'],
  ['Maths','Homework Date','06-01-2021','Submission Date','10-01-2021','Evaluation Date','10-01-2021','Created by Joe','Evaluated By Joe'],
  ['English','Homework Date','06-01-2021','Submission Date','10-01-2021','Evaluation Date','10-01-2021','Created by Joe','Evaluated By Joe'],
  ['Social Science','Homework Date','06-01-2021','Submission Date','10-01-2021','Evaluation Date','10-01-2021','Created by Joe','Evaluated By Joe'],
];

class _HomeworkState extends State<Homework> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Padding(
          padding: const EdgeInsets.only(left: 55.0),
          child: const Text("Demo High School"),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: null == homework ? 0 : homework.length,
            itemBuilder: (context, index) {
              final homeworkData = homework[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        for(final data in homeworkData)
                          SizedBox(
                            width: 300.0,
                            child: Text('$data'),
                        )

                    ]
                  ),
                )
              );
            }
        ),
      )
    );
  }
}

