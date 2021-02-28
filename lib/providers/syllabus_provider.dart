import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/modal/syllabus.dart';

class SyllabusProvider with ChangeNotifier {
  String url = '';

  double subjectCompletion = 0.0, topicsCompletion = 0.0;

  int total = 0;

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

  int lessonsCount(String subject, List<SyllabusData> lessons) {
    int count=0;
    for(int i=0; i<lessons.length; i++) {
      if(lessons[i].subject == subject) count = count+1;
    }
    return count;
  }

  int topicsCount(String subject, String lesson, List<SyllabusData> topics) {
    int count=0;
    for(int i=0; i<topics.length; i++) {
      if(topics[i].subject == subject && topics[i].lesson == lesson
      && !(topics[i].topic == "" || topics[i].topic == null)) count = count+1;
    }
    return count;
  }

  String getTopic(String subject, String lesson, List<SyllabusData> topics, List topicData) {
    for(int i=0; i<topics.length; i++) {
      if (topics[i].subject == subject && topics[i].lesson == lesson
          && !topicData.contains(topics[i].topic)) {
        return topics[i].topic.toString();
      }
    }
  }

  getDetails(String subject, String lesson,
      List<SyllabusData>topics) {
    List topicsData = [];
    int complete = 0, total = 0;
    double totalCompletion = 0.0;

    for(int i=0; i<topics.length; i++) {
      if (topics[i].subject == subject && topics[i].lesson == lesson) {
        var topicDetails = {};
        topicDetails[0] = topics[i].topic;
        topicDetails[1] = topics[i].completion;
        topicDetails[2] = topics[i].date;
        topicsData.add(topicDetails);
        total = total+1;
        if(topicDetails[1] == 'Complete') complete = complete+1;
      }
    }

    if(complete == 0) totalCompletion = 0;
    else totalCompletion = (complete/total) * 100;
    topicsData.add(totalCompletion);
    return topicsData;
  }

}