import 'package:flutter/material.dart';
import 'package:smart_school/modal/teachers_review.dart';

class TeachersReviewCard extends StatefulWidget {
  final TeacherReviewData reviewdata;

  const TeachersReviewCard({this.reviewdata});
  @override
  _TeachersReviewCardState createState() => _TeachersReviewCardState();
}

class _TeachersReviewCardState extends State<TeachersReviewCard> {
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(width: 10.0),
                  Text(
                    '${widget.reviewdata.trName}',
                    style: TextStyle(
                        fontSize: 15.0
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
                          '${widget.reviewdata.phone}'
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
                          builder: (BuildContext context) => Column(
                            children: [
                              ListTile(
                                title: Text('Day'),
                                subtitle: Text('${widget.reviewdata.day}'),
                              ),
                              ListTile(
                                title: Text('Room Number'),
                                subtitle: Text('${widget.reviewdata.roomNumber}'),
                              ),
                              ListTile(
                                title: Text('From Time'),
                                subtitle: Text('${widget.reviewdata.fromTime}'),
                              ),
                              ListTile(
                                title: Text('To Time'),
                                subtitle: Text('${widget.reviewdata.toTime}'),
                              ),
                              ListTile(
                                title: Text('Rating'),
                                subtitle: Text('${widget.reviewdata.rating}'),
                              ),
                            ],
                          )
                      )
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
                      '${widget.reviewdata.email}'
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}