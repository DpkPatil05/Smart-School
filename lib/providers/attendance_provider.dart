import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/attendance.dart';

class AttendanceProvider with ChangeNotifier {
  String url = '';

  double attendancePercentage = 0.0;

  toast(String msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

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
          toast("Problem fetching data");
        }
      } catch(e) {
        toast("Problem fetching data");
      }
    } else toast("No Data connection");
  }

  dateChangeEvent(DateTime date, AttendanceData attendanceData) {
    int month = date.month;
    int year = date.year;
    int total = 0;
    double attended = 0.0;

    for(final attendanceData in attendanceData.attendence.attendancearray) {
      if(int.parse(attendanceData[1]) == month &&
          int.parse(attendanceData[2]) == year &&
          'grey' != attendanceData[5].toString()) {
        total = ++total;
        if('green' == attendanceData[5].toString() ||'#FFFF00' == attendanceData[5].toString())
          attended = ++attended;
        else if('#FF8C00' == attendanceData[5].toString())
          attended = attended + 0.5;
        else attended = attended;
      }
    }

    0 == total ? attendancePercentage = 0
        : attendancePercentage = (attended / total) * 100;

    notifyListeners();
  }

}