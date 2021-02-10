import 'package:flutter/material.dart';

class ClassTimeTable extends StatefulWidget {
  @override
  _ClassTimeTableState createState() => _ClassTimeTableState();
}

class _ClassTimeTableState extends State<ClassTimeTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: 1,
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
                        'Weekday (from server)',
                        style: TextStyle(
                            fontSize: 25.0
                        ),
                      ),
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text(
                                  'Time',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                              )),
                          DataColumn(
                              label: Text(
                                  'Subject',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                              )),
                          DataColumn(
                              label: Text(
                                  'Room No',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                              )),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('from server')),
                            DataCell(Text('from server')),
                            DataCell(Text('from server')),
                          ]),
                        ],
                      ),
                    ],
                  ),
                )
            );
          }
      ),
    );
  }
}

