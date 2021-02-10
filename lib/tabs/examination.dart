import 'package:flutter/material.dart';

class ExaminationTab extends StatefulWidget {
  @override
  _ExaminationTabState createState() => _ExaminationTabState();
}

class _ExaminationTabState extends State<ExaminationTab> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        title: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  Text(
                                    'Exam',
                                    style: TextStyle(
                                        fontSize: 25.0
                                    ),
                                  ),
                                ]
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  onPressed: () => showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) => Container(
                                        alignment: Alignment.center,
                                        height: 300.0,
                                        child: Text('Details about the Notice'),
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.assessment_outlined),
                                      const Text('Results'),
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () => showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) => Container(
                                        alignment: Alignment.center,
                                        height: 300.0,
                                        child: Text('Details about the Notice'),
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.schedule),
                                      const Text('Schedule'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  );
                }
            ),
          )
      );
  }
}
