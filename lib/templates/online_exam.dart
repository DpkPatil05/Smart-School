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
                    style: TextStyle(fontSize: 25.0),
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
                                          child: Text('Exam')
                                      ),
                                      SizedBox(
                                          width: 250.0,
                                          child: Text('server data'))
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
                                          child: Text('server data'))
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
                                          child: Text('Exam From')
                                      ),
                                      SizedBox(
                                          width: 250.0,
                                          child: Text('server data'))
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
                                          child: Text('server data'))
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
                                          child: Text('server data'))
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
                                          child: Text('server data'))
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
                                          child: Text('Total Questions')
                                      ),
                                      SizedBox(
                                          width: 250.0,
                                          child: Text('server data'))
                                    ],
                                ),
                              ),
                              Divider(height: 2.0, thickness: 2.0),
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
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 15.0),
              // Table(
              //   children: [
              //     TableRow(
              //         children: [
              //           Text(
              //             'Date From',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold
              //             ),
              //           ),
              //           Text('${widget.examdata.from}'),
              //         ]),
              //     TableRow(
              //         children: [
              //           Text(
              //             'Date To',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold
              //             ),
              //           ),
              //           Text('${widget.examdata.to}'),
              //         ]),
              //     TableRow(
              //         children: [
              //           Text(
              //             'Total Attempts',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold
              //             ),
              //           ),
              //           Text('${widget.examdata.attempt}'),
              //         ]),
              //     TableRow(
              //         children: [
              //           Text(
              //             'Attempted',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold
              //             ),
              //           ),
              //           Text('${widget.examdata.attempted}'),
              //         ]),
              //     TableRow(
              //         children: [
              //           Text(
              //             'Status',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold
              //             ),
              //           ),
              //           Text('${widget.examdata.status}'),
              //         ]),
              //     TableRow(
              //         children: [
              //           Text(
              //             'Description',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold
              //             ),
              //           ),
              //           Text('${widget.examdata.description}'),
              //         ]),
              //   ],
              // ),

              // Row(
              //   children: [
              //     Table(
              //       defaultColumnWidth: FixedColumnWidth(85.0),
              //       children: [
              //         TableRow(
              //             children: [
              //               Column(
              //                   children:[
              //                     Text(
              //                         'Date From',
              //                         style: TextStyle(fontSize: 15.0)
              //                     )
              //                   ]
              //               ),
              //               Column(
              //                   children:[
              //                     Text('from server')
              //                   ]
              //               ),
              //             ]),
              //         TableRow(
              //             children: [
              //               Column(
              //                   children:[
              //                     Text(
              //                         'Attempts',
              //                         style: TextStyle(fontSize: 15.0)
              //                     )
              //                   ]),
              //               Column(
              //                   children:[
              //                     Text('from server')
              //                   ]),
              //             ]),
              //         TableRow(
              //             children: [
              //               Column(
              //                   children:[
              //                     Text(
              //                         'Duration',
              //                         style: TextStyle(fontSize: 15.0)
              //                     )
              //                   ]),
              //               Column(
              //                   children:[
              //                     Text('from server')
              //                   ]),
              //             ]),
              //       ],
              //     ),
              //     Table(
              //       defaultColumnWidth: FixedColumnWidth(85.0),
              //       children: [
              //         TableRow(
              //             children: [
              //               Column(
              //                   children:[
              //                     Text(
              //                         'Date To',
              //                         style: TextStyle(fontSize: 15.0)
              //                     )
              //                   ]),
              //               Column(
              //                   children:[
              //                     Text('from server')
              //                   ]),
              //             ]),
              //         TableRow(
              //             children: [
              //               Column(
              //                   children:[
              //                     Text(
              //                         'Attempted',
              //                         style: TextStyle(fontSize: 15.0)
              //                     )
              //                   ]),
              //               Column(
              //                   children:[
              //                     Text('from server')
              //                   ]),
              //             ]),
              //         TableRow(
              //             children: [
              //               Column(
              //                   children:[
              //                     Text('Status',
              //                         style: TextStyle(fontSize: 15.0)
              //                     )
              //                   ]),
              //               Column(
              //                   children:[
              //                     Text('from server')
              //                   ]),
              //             ]),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        )
    );
  }
}