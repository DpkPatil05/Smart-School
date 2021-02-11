import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/attendance.dart';
import 'package:smart_school/pages/attendance.dart';
import 'package:smart_school/providers/attendance_provider.dart';

class FetchAttendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<AttendanceData>>.value(
      value: null,
      child: FutureBuilder<List<AttendanceData>>(
        future: AttendanceProvider().fetchAttendance(),
        builder: (BuildContext context, AsyncSnapshot<List<AttendanceData>> attendanceData) {
          switch (attendanceData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return attendanceData.hasError? Text('Error: ${attendanceData.error}')
                  : Attendance(attendancedata: attendanceData.data);
          }
        },
      ),
    );
  }
}