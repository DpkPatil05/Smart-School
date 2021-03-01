import 'package:flutter/material.dart';
import 'package:smart_school/modal/attendance.dart';
import 'package:smart_school/utils/attendance_calender.dart';

class Attendance extends StatefulWidget {
  final AttendanceData attendancedata;

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
                  height: 460.0,
                  child: AttendanceCalender(attendance: widget.attendancedata)
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('This Month: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '${widget.attendancedata.attendence.attendancePerct}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 130.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 30.0,
                              color: Colors.green,
                            ),
                            SizedBox(width: 20.0),
                            Text(
                              'Present',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 30.0,
                              color: Colors.yellow,
                            ),
                            SizedBox(width: 20.0),
                            Text(
                              'Late',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
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
                    ),
                  ),
                  SizedBox(
                    width: 140.0,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 30.0,
                                color: Colors.red,
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
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 30.0,
                                color: Colors.orange,
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
                  ),
                ],
              ),
            ]
        )
      )
     );
  }
}
