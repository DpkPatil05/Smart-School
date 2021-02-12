import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/lesson_plan.dart';

class LessonPlanProvider with ChangeNotifier {
  String url = '';

  // ignore: missing_return
  Future<List<List<LessonPlanData>>> fetchLessonPlan() async {
    url = 'https://www.paperfree-erp.in/mobileapp/lessonplan/lessonplan.php?studentid=${HiveOperation().studentID}';
    print('Lesson data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<List<LessonPlanData>> lessonplanData = lessonPlanDataFromJson(response.body);
          return lessonplanData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<List<LessonPlanData>>();
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