import 'package:flutter/material.dart';
import 'package:smart_school/modal/library.dart';

class LibraryCard extends StatefulWidget {
  final LibraryData librarydata;

  const LibraryCard({Key key, this.librarydata}) : super(key: key);


  @override
  _LibraryCardState createState() => _LibraryCardState();
}

class _LibraryCardState extends State<LibraryCard> {
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.librarydata.bookTitle}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '${widget.librarydata.author}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Table(
                    defaultColumnWidth: FixedColumnWidth(90.0),
                    children: [
                      TableRow(children: [
                        Text(
                          'Book No:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('${widget.librarydata.bookNo}'),
                      ]),
                      TableRow(children: [
                        Text(
                          'Issue Date:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('${widget.librarydata.issueDate}'),
                      ]),
                      TableRow(children: [
                        Text(
                          'Return Date',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('${widget.librarydata.returnDate}'),
                      ]),
                    ],
                  ),
                  // Table(
                  //   defaultColumnWidth: FixedColumnWidth(90.0),
                  //   children: [
                  //     TableRow(children: [
                  //       Text(
                  //         'Due Date',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold
                  //         ),
                  //       ),
                  //       Text('${widget.librarydata}'),
                  //     ]),
                  //     TableRow(children: [
                  //       Text(
                  //         'status',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold
                  //         ),
                  //       ),
                  //       Text('server'),
                  //     ]),
                  //   ],
                  // ),
                ],
              ),
            ],
          )
      ),
    );
  }
}