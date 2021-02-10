import 'package:flutter/material.dart';

class TimetableCard extends StatelessWidget {
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
                    DataCell(Text('English')),
                    DataCell(Text('from server')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('from server')),
                    DataCell(Text('Hindi')),
                    DataCell(Text('from server')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('from server')),
                    DataCell(Text('Maths')),
                    DataCell(Text('from server')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('from server')),
                    DataCell(Text('Social Studies')),
                    DataCell(Text('from server')),
                  ]),
                ],
              ),
            ],
          ),
        )
    );
  }
}