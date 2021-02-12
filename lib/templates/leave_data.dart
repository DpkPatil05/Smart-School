import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/leave_data.dart';
import 'package:smart_school/providers/apply_leave_provider.dart';

class LeaveDataCard extends StatefulWidget {
  final LeaveData leavedata;

  const LeaveDataCard({this.leavedata});

  @override
  _LeaveDataCardState createState() => _LeaveDataCardState();
}

class _LeaveDataCardState extends State<LeaveDataCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Apply Date: ${widget.leavedata.applydate}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                          ),
                        ),
                        RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    Provider.of<ApplyLeaveProvider>(context, listen: false)
                                        .delete(int.parse(widget.leavedata.id))
                                ),
                              );
                            }
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Table(
                  children: [
                    TableRow(children: [
                      Text(
                        'From Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${widget.leavedata.fromdate}'),
                    ]),
                    TableRow(children: [
                      Text(
                        'To date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${widget.leavedata.todate}'),
                    ]),
                    TableRow(children: [
                      Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.leavedata.status}',
                        style: TextStyle(
                          color: widget.leavedata.status == "Approved" ? Colors.green : Colors.deepOrange,
                        ),
                      ),
                    ])
                  ],
                ),
              ]
          ),
        )
    );
  }
}