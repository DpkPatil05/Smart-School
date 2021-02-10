import 'package:flutter/material.dart';
import 'package:smart_school/modal/syllabus.dart';

class SyllabusCard extends StatefulWidget {
  const SyllabusCard({
    @required this.syllabus,
  });

  final SyllabusData syllabus;

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
                Text('${widget.syllabus.lessonname}'),
                Text('${widget.syllabus.date}'),
                Container(
                  height: 30.0,
                  child: IconButton(
                    iconSize: 20.0,
                    icon: Icon(Icons.preview_outlined),
                    tooltip: "View Details",
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => Container(
                          alignment: Alignment.center,
                          height: 300.0,
                          child: Text(
                            '${widget.syllabus.description}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        )
                    ),
                    // child: const Text('View'),
                  ),
                ),
              ]
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
              child: Card(
                child: Container(
                  child: Center(
                    child: Text(
                      '${widget.syllabus.completion}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  color: Colors.teal,
                  height: 25.0,
                ),
              ),
            ),
          ),
        )
    );
  }
}