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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),
                  ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) =>
                        0 != widget.examresultdata[widget.examresultdata.length-2].total.toInt() ?
                        ListTile(
                          title: SingleChildScrollView(
                            child: Column(
                              children: [
                                Table(
                                    columnWidths: { 0: FlexColumnWidth(2), 2: FlexColumnWidth(3),},
                                    children: [
                                      TableRow(
                                          children: [
                                            TableCell(child: Text(
                                              'Grand Total:',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            )),
                                            TableCell(child:  Text('${widget.examresultdata[widget.examresultdata.length-2].total}'),),
                                            TableCell(child: Text(
                                              'Total Marks Obtained:',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            )),
                                            TableCell(child: Text('${widget.examresultdata[widget.examresultdata.length-2].marksObtained}'),)
                                          ]
                                      ),
                                    ]
                                ),
                                Divider(),
                                SizedBox(height: 10.0),
                                Table(
                                  columnWidths: { 0: FlexColumnWidth(2), 1: FlexColumnWidth(2), 2: FlexColumnWidth(2)},
                                  children: [
                                    TableRow(
                                        children: [
                                          TableCell(
                                              child: Text(
                                            'Percentage',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )),
                                          TableCell(
                                              child: Text(
                                            'Result',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )),
                                          TableCell(
                                              child: Text(
                                            'Division',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text('${widget.examresultdata[widget.examresultdata.length-2].perct}'),
                                          Text('${widget.examresultdata[widget.examresultdata.length-2].result}'),
                                          Text('${widget.examresultdata[widget.examresultdata.length-2].division}')
                                        ]
                                    )
                                  ],
                                ),
                                Divider(),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: widget.examresultdata.length-2??0,
                                    itemBuilder: (context, index) {
                                      return ExpansionTile(
                                        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                                        title: Text(
                                          widget.examresultdata[index].subject,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16.0),
                                            child: Text(
                                              'Passing marks: ${widget.examresultdata[index].passingMarks}',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16.0),
                                            child: Text(
                                              'Max Marks: ${widget.examresultdata[index].fullMarks}',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16.0),
                                            child: Text(
                                              'Marks obtained: ${widget.examresultdata[index].marks}',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16.0),
                                            child: Text(
                                              'Note: ${widget.examresultdata[index].note}',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16.0),
                                            child: Text(
                                              'Grade: ${widget.examresultdata[index].grade}',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                          Divider(),
                                        ],
                                      );
                                    }
                                ),
                              ],
                            )
                          ),
                        ) : ListTile(
                            title: Center(child: Text('Results not available'))
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
                        builder: (BuildContext context) =>
                        ListView.builder(
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