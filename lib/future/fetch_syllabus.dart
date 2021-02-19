import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/syllabus.dart';
import 'package:smart_school/providers/syllabus_provider.dart';
import 'package:smart_school/tabs/hamItems/syllabus_status.dart';

class FetchSyllabus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<List<List<SyllabusData>>>>.value(
      value: null,
      child: FutureBuilder<List<List<List<SyllabusData>>>>(
        future: SyllabusProvider().fetchSyllabus(),
        builder: (BuildContext context, AsyncSnapshot<List<List<List<SyllabusData>>>> syllabusData) {
          switch (syllabusData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return syllabusData.hasError? Text('Error: ${syllabusData.error}')
                  : SyllabusStatus(syllabus: syllabusData.data);
          }
        },
      ),
    );
  }
}