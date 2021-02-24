import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/syllabus.dart';
import 'package:smart_school/providers/syllabus_provider.dart';
import 'package:smart_school/tabs/hamItems/syllabus_status.dart';

class FetchSyllabus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<SyllabusData>>.value(
      value: null,
      child: FutureBuilder<List<SyllabusData>>(
        future: SyllabusProvider().fetchSyllabus('http://www.paperfree-erp.in/mobileapp/syllabus/subjects/syllabus.php?'
        'studentid=${HiveOperation().studentID}'),
        builder: (BuildContext context, AsyncSnapshot<List<SyllabusData>> subjectsData) {
          switch (subjectsData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return subjectsData.hasError? Text('Error: ${subjectsData.error}')
                  : FutureBuilder<List<SyllabusData>>(
                future: SyllabusProvider().fetchSyllabus('http://www.paperfree-erp.in/mobileapp/syllabus/lessons/syllabus.php?'
                    'studentid=${HiveOperation().studentID}'),
                builder: (BuildContext context, AsyncSnapshot<List<SyllabusData>> lessonsData) {
                  switch (lessonsData.connectionState) {
                    case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
                    default:
                      return lessonsData.hasError? Text('Error: ${lessonsData.error}')
                          : FutureBuilder<List<SyllabusData>>(
                        future: SyllabusProvider().fetchSyllabus('http://www.paperfree-erp.in/mobileapp/syllabus/topics/syllabus.php?'
                            'studentid=${HiveOperation().studentID}'),
                        builder: (BuildContext context, AsyncSnapshot<List<SyllabusData>> topicsData) {
                          switch (topicsData.connectionState) {
                            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
                            default:
                              return topicsData.hasError? Text('Error: ${topicsData.error}')
                                  : SyllabusStatus(subjects: subjectsData.data, lessons: lessonsData.data, topics: topicsData.data);
                          }
                        },
                      );
                  }
                },
              );
          }
        },
      ),
    );
  }
}