import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/attendance.dart';

class AttendanceProvider with ChangeNotifier {
  String url = '';

  // ignore: missing_return
  Future<AttendanceData> fetchAttendance() async {
    url = 'http://www.paperfree-erp.in/mobileapp/attendance1/attendance1.php?studentid=${HiveOperation().studentID}';
    print('Attendance data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final AttendanceData attendanceData = attendanceDataFromJson(response.body);
          return attendanceData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return AttendanceData();
        }
      } catch(e) {
        Fluttertoast.showToast(
            msg: "Problem fetching data",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } else {
      Fluttertoast.showToast(
          msg: "No Data connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

}