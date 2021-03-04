import 'dart:convert';
import 'dart:typed_data';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/lesson_plan.dart';

class LessonPlanProvider with ChangeNotifier {
  String url = '';
  
  bool imageData = false;

  Uint8List bytes;

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

  String getLessonPlanData(LessonPlanData lessonPlan) {
    String _presentation = lessonPlan.presentation
        .replaceAll('</span>', '');
    _presentation = _presentation
        .replaceAll('</p>', '');
    _presentation = _presentation
        .replaceAll('\\r\\n\\r\\n<p><span style=\\"font-family:serif; font-size:18.4px\\">', '\n\n');
    _presentation = _presentation
        .replaceAll('<span style=\\"font-family:serif; font-size:18.4px\\">', '');
    _presentation = _presentation
        .replaceAll('\\r\\n\\r\\n<p>', ' ');
    _presentation = _presentation
        .replaceAll('<span style="font-family:serif; font-size:11.6px">', '');
    _presentation = _presentation
        .replaceAll('<span style="font-family:serif; font-size:18.4px">', '');
    _presentation = _presentation
        .replaceAll('<span style="font-family:sans-serif; font-size:18.4px">', '\n');
    _presentation = _presentation
        .replaceAll('<span style="font-family:serif; font-size:15.3408px">', '');
    _presentation = _presentation
        .replaceAll('<span style="font-family:serif; font-size:15.6522px">', '');
    _presentation = _presentation
        .replaceAll('<span style="font-family:sans-serif; font-size:19.3953px">', '');
    _presentation = _presentation
        .replaceAll('<span style="font-family:serif; font-size:19.1303px">', '');
    _presentation = _presentation
        .replaceAll('<span style="font-family:serif; font-size:20.4545px">', '');
    _presentation = _presentation
        .replaceAll('<p>', '');
    _presentation = _presentation
        .replaceAll('&pi;', 'π');
    _presentation = _presentation
        .replaceAll('&bull;', '\n');
    _presentation = _presentation
        .replaceAll('&ndash;', '-');
    _presentation = _presentation
        .replaceAll('&nbsp;', '');
    _presentation = _presentation
        .replaceAll('&#39;', '`');
    _presentation = _presentation
        .replaceAll('&rsquo;', '`');
    _presentation = _presentation
        .replaceAll('&rho;', 'ρ');
    _presentation = _presentation
        .replaceAll('&gt;', '>');
    _presentation = _presentation
        .replaceAll('&lt;', '<');
    
    if(_presentation.contains('<img alt="" src="data:image/png;base64,')) {
      imageData = true;
      String _imageByte64Data = _presentation
          .replaceAll('<img alt="" src="data:image/png;base64,', '');
      _imageByte64Data = _imageByte64Data
          .replaceAll('" />', '');
      bytes = base64Decode(_imageByte64Data.trimRight());
      notifyListeners();
    }

    return '${lessonPlan.subject} (${lessonPlan.subCode})'
        'SUBJECTSPLTR${lessonPlan.fromTime} To ${lessonPlan.toTime}'
        'LESSONSPLTR${lessonPlan.lesson}'
        'TOPICSPLTR${lessonPlan.topic}'
        'SUBTOPICSPLTR${lessonPlan.subTopic}'
        'GENOBJECTIVESSPLTR${lessonPlan.generalObjectives}'
        'TEACHINGMETHODSPLTR${lessonPlan.teachingMethod}'
        'PREVKNOWLEDGESPLTR${lessonPlan.previousKnowledge}'
        'COMPREHENSIVEQUESTSPLTR${lessonPlan.comprehensiveQuestions}'
        'PRESENTATIONSPLTR$_presentation';

  }

  String getTitleNPresentation(String lessonPlanData, String splitter, int index) {
    List<String> title = lessonPlanData.split('$splitter');
    return title[index];
  }

  String getData(String lessonPlanData, String splitter1, String splitter2) {
    List<String> splitedString = lessonPlanData.split('$splitter1');
    List<String> requiredString = splitedString[0].split('$splitter2');
    return requiredString[1];
  }

}