import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_school/modal/syllabus.dart';
import 'package:smart_school/providers/syllabus_provider.dart';

class SyllabusCard extends StatefulWidget {
  const SyllabusCard({@required this.subject, this.lessons, this.topics});

  final SyllabusData subject;

  final List<SyllabusData> lessons, topics;

  @override
  _SyllabusCardState createState() => _SyllabusCardState();
}

class _SyllabusCardState extends State<SyllabusCard> {
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
              children:[
                Text('${widget.subject.subject}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0
                  ),
                ),
                IconButton(
                  iconSize: 20.0,
                  icon: Icon(Icons.preview_outlined),
                  tooltip: "View Details",
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => ListView.builder(
                        itemCount: SyllabusProvider()
                            .lessonsCount(widget.subject.subject, widget.lessons),
                        itemBuilder: (BuildContext context, int index0) {
                          var topicData = SyllabusProvider()
                              .getDetails(widget.subject.subject,
                              widget.lessons[index0].lesson,
                              widget.topics);
                          return ExpansionTile(
                            title: Text(
                              '${widget.lessons[index0].lesson}',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            children: [
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: SizedBox(
                                      height: 240.0,
                                      child: 0 == SyllabusProvider()
                                          .topicsCount(widget.subject.subject,
                                          widget.lessons[index0].lesson,
                                          widget.topics) ?
                                          Center(child: Text('No data',
                                              style: TextStyle(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold)
                                          ))
                                          : ListView.builder(
                                          itemCount: SyllabusProvider().topicsCount(
                                              widget.subject.subject,
                                              widget.lessons[index0].lesson,
                                              widget.topics),
                                          itemBuilder: (BuildContext context,
                                              int index1) {
                                            return ListBody(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(left: 14.0),
                                                      child: SizedBox(
                                                          width: 160.0,
                                                          child: Text('Topic:')
                                                      ),
                                                    ),
                                                    Text('${topicData[index1][0]}'),
                                                    SizedBox(width: 5.0),
                                                  ],
                                                ),
                                                SizedBox(height: 5.0),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(left: 14.0),
                                                      child: SizedBox(
                                                          width: 180.0,
                                                          child: Text('Status:')
                                                      ),
                                                    ),
                                                    'Complete' == topicData[index1][1] ?
                                                    Text('${topicData[index1][1]}',
                                                        style: TextStyle(
                                                            color: Colors.green))
                                                        : Text(
                                                        '${topicData[index1][1]}',
                                                        style: TextStyle(
                                                            color: Colors.red)),
                                                    SizedBox(width: 5.0),
                                                  ],
                                                ),
                                                SizedBox(height: 5.0),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(left: 14.0),
                                                      child: SizedBox(
                                                          width: 180.0,
                                                          child: Text(
                                                              'Completion Date:')
                                                      ),
                                                    ),
                                                    Text('${topicData[index1][2]}'),
                                                    SizedBox(width: 5.0),
                                                  ],
                                                ),
                                                Divider(thickness: 3.0),
                                                SizedBox(height: 25.0),
                                              ],
                                            );
                                          }
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}