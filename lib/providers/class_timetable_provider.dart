import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/timetable.dart';

class TimetableProvider with ChangeNotifier {
  String url = '';

  // ignore: missing_return
  Future<List<TimeTableData>> fetchTimetable() async {
    url = 'http://www.paperfree-erp.in/mobileapp/timetable/timetable.php?studentid=${HiveOperation().studentID}';
    print('Timetable data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<TimeTableData> timetableData = timeTableDataFromJson(response.body);
          return timetableData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<TimeTableData>();
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