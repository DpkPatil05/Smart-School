import 'package:flutter/material.dart';

import 'package:smart_school/modal/timeline.dart';
import 'package:smart_school/templates/timeline.dart';

class TimelineTab extends StatefulWidget {
  final List<TimelineData> timelineData;

  const TimelineTab({this.timelineData});
  @override
  _TimelineTabState createState() => _TimelineTabState();
}

class _TimelineTabState extends State<TimelineTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 0 == widget.timelineData.length ?
      Card(
        child: Center(
            child: Text(
              "No data available",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
              ),
            )
        ),
      ) : ListView.builder(
        itemCount: widget.timelineData.length??0,
        itemBuilder: (BuildContext context, int index) {
          return TimelineCard(timelinedata: widget.timelineData[index]);
        },
      ),
    );
  }
}
