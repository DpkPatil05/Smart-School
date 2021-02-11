import 'package:flutter/material.dart';

class LessonPlan extends StatefulWidget {
  @override
  _LessonPlanState createState() => _LessonPlanState();
}

class _LessonPlanState extends State<LessonPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('MONDAY'),
                    IconButton(
                      iconSize: 20.0,
                      icon: Icon(Icons.preview_outlined),
                      tooltip: "View Details",
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) => Container(
                            alignment: Alignment.center,
                            height: 500.0,
                            child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: ListTile(
                                        title: Column(
                                          children: [
                                            Text(
                                                'Subject',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Table(
                                              children: [
                                                TableRow(children: [
                                                  Text(
                                                    'Room No',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Text('server'),
                                                ]),
                                                TableRow(children: [
                                                  Text(
                                                    'From Time',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Text('server'),
                                                ]),
                                                TableRow(children: [
                                                  Text(
                                                    'To Time',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Text('server'),
                                                ])
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                  );
                                }
                            ),
                          )
                      ),
                    ),
                  ],
                )
            ),
            );
          }
      ),
    );
  }
}