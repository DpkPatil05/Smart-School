import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/lesson_plan.dart';

class LessonPlanProvider with ChangeNotifier {
  String url = '';

  toast(String msg) {
    Fluttertoast.showToast(
        msg: '$msg',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  // ignore: missing_return
  Future<List<LessonPlanData>> fetchLessonPlan() async {
    url = 'https://www.paperfree-erp.in/mobileapp/lessonplan/lessonplan.php?studentid=${HiveOperation().studentID}';
    print('Lesson data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<LessonPlanData> lessonplanData = lessonPlanDataFromJson(response.body);
          return lessonplanData;
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

  int getCount(List<LessonPlanData> lessonplan, DateTime date) {
    int count = 0;
    String selectedDate = '${date.year}-${date.month}-${date.day}';
    for(final data in lessonplan) {
      if(data.date == selectedDate)
        count = ++count;
    }
    return count;
  }

}