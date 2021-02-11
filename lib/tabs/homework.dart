import 'package:flutter/material.dart';

class HomeworkTab extends StatefulWidget {
  @override
  _HomeworkTabState createState() => _HomeworkTabState();
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

class _HomeworkTabState extends State<HomeworkTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: null == homework ? 0 : homework.length,
              itemBuilder: (context, index) {
                // final homeworkData = homework[index];
                return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Subject",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0
                                  ),
                                ),
                                SizedBox(
                                  width: 40.0,
                                  child: FlatButton(
                                    onPressed: () => showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) => Container(
                                          alignment: Alignment.center,
                                          height: 300.0,
                                          child: Text('Details about the HomeWork'),
                                        )
                                    ),
                                    child: Icon(Icons.preview_outlined),
                                    ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Class",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0
                                  ),
                                ),
                                Text(
                                    "Status",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20.0
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Table(
                              children: [
                                TableRow(children: [
                                  Text(
                                      'Homework Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text('from server'),
                                ]),
                                TableRow(children: [
                                  Text(
                                      'Submission Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text('from server'),
                                ]),
                                TableRow(children: [
                                  Text(
                                      'Evaluation Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text('from server'),
                                ])
                              ],
                            ),
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



// for(final data in homeworkData)
// SizedBox(
// width: 300.0,
// child: Text('$data'),
// )