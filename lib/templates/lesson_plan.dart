import 'package:flutter/material.dart';
import 'package:smart_school/modal/lesson_plan.dart';

class LessonPlanCard extends StatefulWidget {
  final List<LessonPlanData> lessonplan;

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
      child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.lessonplan[0].day}'),
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
                          itemCount: widget.lessonplan.length??0,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Table(
                                        children: [
                                          TableRow(children: [
                                            Text(
                                              'Subject',
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text('${widget.lessonplan[index].subject}'),
                                          ]),
                                        ],
                                      ),
                                      SizedBox(height: 6.0),
                                      Table(
                                        children: [
                                          TableRow(children: [
                                            Text(
                                              'Room No',
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text('${widget.lessonplan[index].roomno}'),
                                          ]),
                                          TableRow(children: [
                                            Text(
                                              'From Time',
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text('${widget.lessonplan[index].timeFrom}'),
                                          ]),
                                          TableRow(children: [
                                            Text(
                                              'To Time',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text('${widget.lessonplan[index].timeTo}'),
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
}