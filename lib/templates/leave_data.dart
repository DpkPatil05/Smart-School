import 'package:flutter/cupertino.dart';
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
    Future<bool> _onPressed(){
      return showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text('Are You Sure'),
              content: Text('You are going delete the leave!'),
              actions: <Widget>[
                FlatButton(
                  child: Text('NO'),
                  onPressed: (){
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('YES'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          Provider.of<ApplyLeaveProvider>(context, listen: false)
                              .delete(int.parse(widget.leavedata.id))
                      ),
                    );
                  },
                )
              ],
            );
          }
      );
    }
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: Text(
                        '${widget.leavedata.reason}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            _onPressed();
                          },
                          elevation: 2.0,
                          fillColor: Colors.grey,
                          child: Icon(
                            Icons.delete,
                            size: 15.0,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Table(
                  children: [
                    TableRow(children: [
                      Text(
                        'Apply Date',
                        style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                      Text('${widget.leavedata.applydate}'),
                    ]),
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