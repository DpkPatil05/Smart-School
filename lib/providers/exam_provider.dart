import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/modal/exam.dart';
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/exam_result.dart';
import 'package:smart_school/modal/exam_schedule.dart';

class ExamProvider with ChangeNotifier {
  String url = '';

  // ignore: missing_return
  Future<List<Exam>> fetchExam() async {
    url = 'http://www.paperfree-erp.in/mobileapp/exam/exam.php?studentid=${HiveOperation().studentID}';
    print('Exam data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<Exam> examData = examFromJson(response.body);
          return examData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<Exam>();
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

  // ignore: missing_return
  Future<List<ExamSchedule>> fetchExamSchedule(int examID) async {
    url = 'http://www.paperfree-erp.in/mobileapp/examschedule/exams.php?examid=$examID';
    print('Fees data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<ExamSchedule> examScheduleData = examScheduleFromJson(response.body);
          return examScheduleData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<ExamSchedule>();
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

  // ignore: missing_return
  Future<List<ExamResult>> fetchExamResult(int examID) async {
    url = 'http://www.paperfree-erp.in/mobileapp/examresult/exam.php?examid=$examID&studentid=${HiveOperation().studentID}';
    print('Exam result data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<ExamResult> examResultData = examResultFromJson(response.body);
          return examResultData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<ExamResult>();
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