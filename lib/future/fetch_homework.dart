import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/homework.dart';
import 'package:smart_school/providers/homework_provider.dart';
import 'package:smart_school/tabs/homework.dart';

class FetchHomework extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<HomeworkData>>.value(
      value: null,
      child: FutureBuilder<List<HomeworkData>>(
        future: HomeworkProvider().fetchHomework(),
        builder: (BuildContext context, AsyncSnapshot<List<HomeworkData>> hwData) {
          switch (hwData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return hwData.hasError? Text('Error: ${hwData.error}')
                  : HomeworkTab(hwdata: hwData.data);
          }
        },
      ),
    );
  }
}