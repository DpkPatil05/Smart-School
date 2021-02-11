import 'package:flutter/material.dart';
import 'package:smart_school/modal/exam_result.dart';
import 'package:smart_school/modal/exam_schedule.dart';

class ExamCard extends StatefulWidget {
  final List<ExamSchedule> examscheduledata;
  final List<ExamResult> examresultdata;
  final String exam;

  const ExamCard({this.examscheduledata, this.examresultdata, this.exam});

  @override
  _ExamCardState createState() => _ExamCardState();
}

class _ExamCardState extends State<ExamCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          title: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      '${widget.exam}',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => ListView.builder(
                            itemCount: widget.examscheduledata.length-1??0,
                            itemBuilder: (context, index) {
                              return ExpansionTile(
                                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                                title: Text(widget.examresultdata[index].subject),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text('Passing marks: ${widget.examresultdata[index].passingMarks}'),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text('Marks obtained: ${widget.examresultdata[index].marks}'),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text('Note: ${widget.examresultdata[index].result}'),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text('Start Time: ${widget.examresultdata[index].note}'),
                                  ),
                                ],
                              );
                            }
                        ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.assessment_outlined),
                        const Text('Results'),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => ListView.builder(
                          itemCount: widget.examscheduledata.length-1??0,
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                              title: Text(widget.examscheduledata[index].subject),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text('Room: ${widget.examscheduledata[index].room}'),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text('Passing Marks: ${widget.examscheduledata[index].passingMarks}'),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text('Full Marks: ${widget.examscheduledata[index].fullMarks}'),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text('Date: ${widget.examscheduledata[index].date}'),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text('Start Time: ${widget.examscheduledata[index].start}'),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text('End Time: ${widget.examscheduledata[index].end}'),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text('Duration: ${widget.examscheduledata[index].duration}'),
                                ),
                                Divider(),
                              ],
                            );
                          }
                        ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.schedule),
                        const Text('Schedule'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}