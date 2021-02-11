import 'package:flutter/material.dart';
import 'package:smart_school/modal/library.dart';

class Library extends StatefulWidget {
  final List<LibraryData> librarydata;

  const Library({this.librarydata});
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Subject name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Author name',
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
                              Text('server'),
                            ]),
                            TableRow(children: [
                              Text(
                                'Issue Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('server'),
                            ]),
                            TableRow(children: [
                              Text(
                                'Return Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('server'),
                            ]),
                          ],
                        ),
                        Table(
                          defaultColumnWidth: FixedColumnWidth(90.0),
                          children: [
                            TableRow(children: [
                              Text(
                                'Due Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('server'),
                            ]),
                            TableRow(children: [
                              Text(
                                'status',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('server'),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
            ),
          );
        }
    );
  }
}
