import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/leave_data.dart';
import 'package:smart_school/providers/apply_leave_provider.dart';
import 'package:smart_school/services/check_permissions.dart';

class LeaveDataCard extends StatefulWidget {
  final LeaveData leavedata;

  const LeaveDataCard({this.leavedata});

  @override
  _LeaveDataCardState createState() => _LeaveDataCardState();
}

class _LeaveDataCardState extends State<LeaveDataCard> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _delete(){
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
                    Navigator.of(context).pop(false);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.red,
                                  title: Text('Apply Leave'),
                                ),
                                body: Provider.of<ApplyLeaveProvider>(context)
                                    .delete(int.parse(widget.leavedata.id)),
                              ),
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
                        widget.leavedata.doc == "" ?
                        IconButton(
                          tooltip: 'Download',
                          icon: Icon(
                            Icons.download_rounded,
                            size: 25.0,
                          ),
                          onPressed: () {
                            CheckPermissions().checkStoragePermission().then((value) =>
                                ApplyLeaveProvider().generateDownload(widget.leavedata.doc));
                          })
                          : SizedBox(width: 5.0),
                        IconButton(
                          tooltip: 'Delete',
                          icon: Icon(
                            Icons.delete,
                            size: 25.0,
                          ),
                          onPressed: () {
                            _delete();
                          }),
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
                          color: widget.leavedata.status == "Approved" ?
                          Colors.green : Colors.deepOrange,
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