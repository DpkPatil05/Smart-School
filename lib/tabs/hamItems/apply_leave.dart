import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplyLeave extends StatefulWidget {
  @override
  _ApplyLeaveState createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  DateTime _fromdate;
  DateTime _todate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => Container(
                alignment: Alignment.center,
                height: 800.0,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Form(
                        // key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(width: 10.0),
                                  Text(
                                      _fromdate == null? 'From Date' :_fromdate.toString().substring(0,10),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(width: 20.0),
                                  RaisedButton(
                                    child: Text('From date'),
                                      onPressed: () {
                                        showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2050)
                                        ).then((date){
                                          setState(() {
                                            _fromdate = date;
                                          });
                                        });
                                      }
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(width: 10.0),
                                  Text(
                                      _todate == null? 'To Date' :_todate.toString().substring(0,10),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(width: 20.0),
                                  RaisedButton(
                                      child: Text('From date'),
                                      onPressed: () {
                                        showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2050)
                                        ).then((date){
                                          setState(() {
                                            _todate = date;
                                          });
                                        });
                                      }
                                  )
                                ],
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.notes),
                                  hintText: 'Reason for leave',
                                  labelText: 'Reason',
                                ),
                              ),
                            ]
                        )
                    ),
                    RaisedButton(
                        child: Text('Submit'),
                        onPressed: null
                    )
                  ],
                )
          ),
        ),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            // final homeworkData = homework[index];
            return  Card(
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
                            Text(
                              'Apply Date: from server',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Table(
                          children: [
                            TableRow(children: [
                              Text(
                                'From Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('from server'),
                            ]),
                            TableRow(children: [
                              Text(
                                'To date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('from server'),
                            ]),
                            TableRow(children: [
                              Text(
                                'Reason',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('from server'),
                            ])
                          ],
                        ),
                      ]
                  ),
                )
            );
          }
      ),
    );
  }
}

