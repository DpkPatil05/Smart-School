import 'package:flutter/material.dart';
import 'package:smart_school/pages/pending_task_list.dart';
//import 'file:///D:/AndroidStudioProjects/FlutterProjects/SmartSchool/smart_school/lib/pages/pending_task_list.dart';
class MyPendingTasks extends StatefulWidget {
  @override
  _MyPendingTasksState createState() => _MyPendingTasksState();
}

class _MyPendingTasksState extends State<MyPendingTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.only(left: 55.0),
            child: const Text("Demo High School"),
          ),
        ),
        body: ReorderableListExample()
    );
  }
}
