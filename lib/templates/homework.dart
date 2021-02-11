import 'package:flutter/material.dart';
import 'package:smart_school/modal/homework.dart';

class HomeworkCard extends StatefulWidget {
  final HomeworkData hwdata;

  const HomeworkCard({this.hwdata});

  @override
  _HomeworkCardState createState() => _HomeworkCardState();
}

class _HomeworkCardState extends State<HomeworkCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.hwdata.subject}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                      child: FlatButton(
                        onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) => Container(
                              alignment: Alignment.center,
                              height: 300.0,
                              child: Text(
                                '${widget.hwdata.description}',
                                textAlign: TextAlign.center
                              ),
                            )
                        ),
                        child: Icon(Icons.preview_outlined),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.hwdata.completion}",
                      style: "Complete" == widget.hwdata.completion ?
                      TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      ) :
                      TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      )
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Table(
                  children: [
                    TableRow(children: [
                      Text(
                        'Homework Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('${widget.hwdata.hwdate}'),
                    ]),
                    TableRow(children: [
                      Text(
                        'Submission Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('${widget.hwdata.submitdate}'),
                    ]),
                    TableRow(children: [
                      Text(
                        'Evaluation Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('${widget.hwdata.evaldate}'),
                    ])
                  ],
                ),
              ]
          ),
        )
    );
  }
}