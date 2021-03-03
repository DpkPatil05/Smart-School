import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/attendance.dart';
import 'package:smart_school/providers/attendance_provider.dart';
import 'package:smart_school/utils/attendance_calender.dart';

class Attendance extends StatefulWidget {
  final AttendanceData attendancedata;
  const Attendance({this.attendancedata});
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      Provider.of<AttendanceProvider>(context, listen: false)
          .dateChangeEvent(DateTime.now(), widget.attendancedata);
    });
    super.initState();
  }

  double displayPercentage;

  @override
  Widget build(BuildContext context) {
    setState(() {
      this.displayPercentage =
          Provider.of<AttendanceProvider>(context, listen: true).attendancePercentage;
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: AttendanceCalender(attendance: widget.attendancedata)
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Attendance: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    0 == displayPercentage ? 'Not Available'
                        :'${displayPercentage?.toStringAsFixed(2)??0}%',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
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
            ),
          ]
      )
     );
  }
}
