import 'package:flutter/material.dart';
import 'package:smart_school/modal/timeline.dart';

class TimelineCard extends StatefulWidget {
  final TimelineData timelinedata;
  const TimelineCard({this.timelinedata});
  @override
  _TimelineCardState createState() => _TimelineCardState();
}

class _TimelineCardState extends State<TimelineCard> {
  @override
  Widget build(BuildContext context) {
    return 'nodata' == widget.timelinedata.title?
      Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Center(child: Text(
          'No record found',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0
          ),
        )),
      )
    : Container(
      height: 200.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
            children: <Widget>[
              SizedBox( height: 10.0),
              Expanded(
                child: Center(
                  child: Text(
                    "${widget.timelinedata.title}",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Date:",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "${widget.timelinedata.timelineDate}",
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 300.0,
                          child: Text(
                            "${widget.timelinedata.description}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}