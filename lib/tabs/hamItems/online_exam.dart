import 'package:flutter/material.dart';

class OnlineExam extends StatefulWidget {
  @override
  _OnlineExamState createState() => _OnlineExamState();
}

class _OnlineExamState extends State<OnlineExam> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From Server',
                        style: TextStyle(
                            fontSize: 25.0
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Table(
                        children: [
                          TableRow(
                              children: [
                                Text(
                                    'Date From',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('from server'),
                          ]),
                          TableRow(
                              children: [
                                Text(
                                    'Date To',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('from server'),
                          ]),
                          TableRow(
                              children: [
                                Text(
                                    'Total Attempts',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('from server'),
                          ]),
                          TableRow(
                              children: [
                                Text(
                                    'Attempted',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('from server'),
                          ]),
                          TableRow(
                              children: [
                                Text(
                                    'Duration',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('from server'),
                          ]),
                          TableRow(
                              children: [
                                Text(
                                    'Status',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('from server'),
                          ])
                        ],
                      ),

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
      ),
    );
  }
}

