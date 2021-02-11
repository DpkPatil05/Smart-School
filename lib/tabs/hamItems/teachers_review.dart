import 'package:flutter/material.dart';

class TeachersReview extends StatefulWidget {
  @override
  _TeachersReviewState createState() => _TeachersReviewState();
}

class _TeachersReviewState extends State<TeachersReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            // final homeworkData = homework[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                title: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_sharp),
                        Text(
                          'Teachers Name',
                          style: TextStyle(
                              fontSize: 24.0
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.call),
                            SizedBox(width: 10.0),
                            Text(
                                'From server'
                            ),
                          ],
                        ),
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
                                  child: Text('Details about the Notice'),
                                )
                            ),
                            // child: const Text('View'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 10.0),
                        Text(
                            'From server'
                        ),
                      ],
                    ),
                  ],
                ),
              )
            );
          }
          )
    );
  }
}

