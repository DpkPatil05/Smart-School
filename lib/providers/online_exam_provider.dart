import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/online_exam.dart';

class OnlineExamProvider with ChangeNotifier {
  String url = '';

  static const Map<String, int> monthsInYear = {
    "Jan": 01,
    "Feb": 02,
    "Mar": 03,
    "Apr": 04,
    "May": 05,
    "Jun": 06,
    "Jul": 07,
    "Aug": 08,
    "Sep": 09,
    "Oct": 10,
    "Nov": 11,
    "Dec": 12,
  };

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

  bool checkDate(String fromDate, String toDate) {
    int fromDay = int.parse(fromDate.substring(0, 2));
    int toDay = int.parse(toDate.substring(0, 2));
    int fromMonth = monthsInYear[fromDate.substring(3, 6)];
    int toMonth = monthsInYear[toDate.substring(3, 6)];
    int fromYear = int.parse(fromDate.substring(8, 12));
    int toYear = int.parse(toDate.substring(8, 12));

    var startDate = DateTime(fromYear, fromMonth, fromDay);
    var endDate = DateTime(toYear, toMonth, toDay);

    // DateTime startDate = DateTime.parse('$fromYear-$fromMonth-$fromDay');
    // DateTime endDate = DateTime.parse('$toYear-$toMonth-$toDay');

    DateTime now = DateTime.now();

    if(startDate.isBefore(now) && endDate.isAfter(now))
      return true;
    else
      return false;
  }

  // ignore: missing_return
  Future<List<List<OnlineExamData>>> fetchOnlineExam() async {
    url = 'http://www.paperfree-erp.in/mobileapp/onlineexam/exam.php?studentid=${HiveOperation().studentID}';
    print('Online exam data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<List<OnlineExamData>> olexamData = onlineExamDataFromJson(response.body);
          return olexamData;
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
}