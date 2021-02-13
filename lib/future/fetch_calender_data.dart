import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/attendance.dart';
import 'package:smart_school/providers/attendance_provider.dart';
import 'package:smart_school/utils/calender_view.dart';

class FetchCalender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AttendanceData>.value(
      value: null,
      child: FutureBuilder<AttendanceData>(
        future: AttendanceProvider().fetchAttendance(),
        builder: (BuildContext context, AsyncSnapshot<AttendanceData> attendanceData) {
          switch (attendanceData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return attendanceData.hasError? Text('Error: ${attendanceData.error}')
                  : Calender(attendance: attendanceData.data);
          }
        },
      ),
    );
  }
}