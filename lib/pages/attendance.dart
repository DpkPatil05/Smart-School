import 'package:flutter/material.dart';
import 'package:smart_school/modal/attendance.dart';
import 'package:smart_school/utils/calender_view.dart';

class Attendance extends StatefulWidget {
  final List<AttendanceData> attendancedata;

  const Attendance({this.attendancedata});
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
            children: [
              Container(
                  height: 400.0,
                  child: Calender()
              ),
              SizedBox(height: 30.0,),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 30.0,
                        color: Colors.green,
                      ),
                      SizedBox(width: 20.0,),
                      Text(
                        'Present',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 50.0),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 30.0,
                        color: Colors.brown,
                      ),
                      SizedBox(width: 20.0,),
                      Text(
                        'Absent',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  ]
                ),

                Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 30.0,
                            color: Colors.yellow,
                          ),
                          SizedBox(width: 20.0,),
                          Text(
                            'Late      ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 50.0,),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 30.0,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            'Half Day',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ]
                ),

                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      'Holiday',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ]
            )
          )
     );
  }
}
