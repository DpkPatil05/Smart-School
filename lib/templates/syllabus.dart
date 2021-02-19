import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_school/modal/syllabus.dart';

class SyllabusCard extends StatefulWidget {
  const SyllabusCard({@required this.syllabus});

  final List<List<SyllabusData>> syllabus;

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
                Text('${widget.syllabus[0][0].subject}',
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
                        itemCount: widget.syllabus?.length??0,
                        itemBuilder: (BuildContext context, int index0) =>
                          ExpansionTile(
                            title: Text(
                              '${widget.syllabus[index0][0].lesson}',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            children: [
                              ListView.builder(
                                  itemCount: widget.syllabus[index0]?.length??0,
                                  itemBuilder: (BuildContext context, int index1) =>
                                    ListBody(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Topic:'),
                                            Text('${widget.syllabus[index0][index1].topic}'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Status:'),
                                            Text('${widget.syllabus[index0][index1].completion}'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Completion Date:'),
                                            Text('${widget.syllabus[index0][index1].date}'),
                                          ],
                                        ),
                                      ],
                                    ),
                              ),
                            ],
                          ),
                      ),
                  ),
                  // child: const Text('View'),
                ),
              ]
          ),
        )
    );
  }
}