import 'package:flutter/material.dart';
import 'package:smart_school/modal/homework.dart';
import 'package:smart_school/templates/homework.dart';

class HomeworkTab extends StatefulWidget {
  final List<HomeworkData> hwdata;

  const HomeworkTab({this.hwdata});
  @override
  _HomeworkTabState createState() => _HomeworkTabState();
}

class _HomeworkTabState extends State<HomeworkTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: widget.hwdata.length-1??0,
              itemBuilder: (context, index) {
                return HomeworkCard(hwdata: widget.hwdata[index]);
              }
          ),
        )
    );
  }
}