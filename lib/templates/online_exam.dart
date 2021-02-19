import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_school/modal/online_exam.dart';

class OnlineExamCard extends StatefulWidget {
  final OnlineExamData examdata;

  const OnlineExamCard({this.examdata});
  @override
  _OnlineExamCardState createState() => _OnlineExamCardState();
}

class _OnlineExamCardState extends State<OnlineExamCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.examdata.exam}',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  IconButton(
                    iconSize: 30.0,
                    icon: Icon(Icons.preview_outlined),
                    tooltip: "View Details",
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) =>
                        ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 120.0,
                                          child: Text('Exam From')
                                      ),
                                      SizedBox(
                                          width: 250.0,
                                          child: Text('${widget.examdata.from}'))
                                    ],
                                ),
                              ),
                              Divider(height: 2.0, thickness: 2.0),
                              Expanded(
                                flex: 1,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 120.0,
                                          child: Text('Exam To')
                                      ),
                                      SizedBox(
                                          width: 250.0,
                                          child: Text('${widget.examdata.to}'))
                                    ],
                                ),
                              ),
                              Divider(height: 2.0, thickness: 2.0),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 120.0,
                                        child: Text('Total Attempt')
                                    ),
                                    SizedBox(
                                        width: 250.0,
                                        child: Text('${widget.examdata.totalAttempt}'))
                                  ],
                                ),
                              ),
                              Divider(height: 2.0, thickness: 2.0),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 120.0,
                                        child: Text('Attempted')
                                    ),
                                    SizedBox(
                                        width: 250.0,
                                        child: Text('${widget.examdata.attempted}'))
                                  ],
                                ),
                              ),
                              Divider(height: 2.0, thickness: 2.0),
                              Expanded(
                                flex: 1,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 120.0,
                                          child: Text('Duration')
                                      ),
                                      SizedBox(
                                          width: 250.0,
                                          child: Text('${widget.examdata.duration}'))
                                    ],
                                ),
                              ),
                              Divider(height: 2.0, thickness: 2.0),
                              Expanded(
                                flex: 1,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 120.0,
                                          child: Text('Passing(%)')
                                      ),
                                      SizedBox(
                                          width: 250.0,
                                          child: Text('${widget.examdata.passing}'))
                                    ],
                                ),
                              ),
                              Divider(height: 2.0, thickness: 2.0),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 120.0,
                                        child: Text('Status')
                                    ),
                                    SizedBox(
                                        width: 250.0,
                                        child: Text('${widget.examdata.status}'))
                                  ],
                                ),
                              ),
                              Divider(height: 2.0, thickness: 2.0),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 120.0,
                                        child: Text('Description')
                                    ),
                                    SizedBox(
                                        width: 250.0,
                                        child: Text('${widget.examdata.description}'))
                                  ],
                                ),
                              ),
                              Divider(height: 2.0, thickness: 2.0),
                              widget.examdata.attempted < int.parse(widget.examdata.totalAttempt) ?
                              Expanded(
                                flex: 1,
                                child: SizedBox.expand(
                                  child: RaisedButton(
                                    child: Text('Start Exam'),
                                    color: Colors.red,
                                    textColor: Colors.white,
                                    onPressed: () {  }
                                    ),
                                )
                              ) : SizedBox(height: 5.0),
                            ],
                          ),
                        )
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