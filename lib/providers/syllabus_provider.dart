import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/modal/syllabus.dart';

class SyllabusProvider with ChangeNotifier {
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

  int lessonsCount(String subject, List<SyllabusData> lessons) {
    int count=0;
    for(int i=0; i<lessons.length; i++) {
      if(lessons[i].subject == subject) count = count+1;
    }
    print("Lesson count for $subject = $count");
    return count;
  }

  int topicsCount(String subject, String lesson, List<SyllabusData> topics) {
    int count=0;
    for(int i=0; i<topics.length; i++) {
      if(topics[i].subject == subject && topics[i].lesson == lesson) count = count+1;
    }
    print("topic count for $lesson = $count");
    return count;
  }


  // ignore: missing_return
  Future<List<SyllabusData>> fetchSyllabus(String url) async {
    print('Syllabus data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<SyllabusData> syllabusData = syllabusDataFromJson(response.body);
          return syllabusData;
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