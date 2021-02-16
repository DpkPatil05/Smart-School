import 'package:flutter/material.dart';
import 'package:smart_school/modal/timetable.dart';

class TimetableCard extends StatefulWidget {
  final List<TimetableData> timetabledata;

  const TimetableCard({this.timetabledata});

  @override
  _TimetableCardState createState() => _TimetableCardState();
}

class _TimetableCardState extends State<TimetableCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.timetabledata[0].day}'),
              IconButton(
                iconSize: 20.0,
                icon: Icon(Icons.preview_outlined),
                tooltip: "View Details",
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => Container(
                      alignment: Alignment.center,
                      height: 500.0,
                      child: ListView.builder(
                          itemCount: widget.timetabledata.length??0,
                          itemBuilder: (context, index) {
                            return "Not Scheduled" == widget.timetabledata[index].subject ?
                            Padding(
                              padding: const EdgeInsets.only(top: 138.0),
                              child: Center(
                                  child: Text(
                                    "Not Scheduled",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,

                                    ),
                                  )
                              ),
                            )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 20.0),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Divider(),
                                      SizedBox(
                                        width: 90.0,
                                        child: Text(
                                          "${widget.timetabledata[index].subject}",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80.0,
                                        child: Text(
                                          "${widget.timetabledata[index].timeFrom} "
                                              "- ${widget.timetabledata[index].timeTo}",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 90.0,
                                        child: Text(
                                          "Room(${widget.timetabledata[index].roomno})",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                      ),
                    )
                ),
              ),
            ],
          )
      ),
    );
  }
}