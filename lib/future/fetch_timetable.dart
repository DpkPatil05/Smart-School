import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/timetable.dart';
import 'package:smart_school/providers/class_timetable_provider.dart';
import 'package:smart_school/tabs/hamItems/class_time_table.dart';

class FetchTimetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<List<TimetableData>>>.value(
      value: null,
      child: FutureBuilder<List<List<TimetableData>>>(
        future: TimetableProvider().fetchTimetable(),
        builder: (BuildContext context, AsyncSnapshot<List<List<TimetableData>>> timetableData) {
          switch (timetableData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return timetableData.hasError? Text('Error: ${timetableData.error}')
                  : ClassTimeTable(timetabledata: timetableData.data);
          }
        },
      ),
    );
  }
}