import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_school/modal/teachers_review.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:smart_school/providers/teachers_review_provider.dart';

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
                          builder: (BuildContext context) => SingleChildScrollView(
                            child: Column(
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
                                ExpansionTile(
                                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                                  title: Text('Subjects'),
                                  children: [
                                    Container(
                                      child:ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                        itemCount: 3,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Padding(
                                              padding: const EdgeInsets.only(left: 16.0),
                                              child: Text('english'),
                                            ),
                                          );
                                        }
                                      )
                                    ),
                                  ],
                                ),
                                ListTile(
                                  title: Text('Rating'),
                                  subtitle: '0'==widget.reviewdata.rating?
                                            Row(
                                              children: [
                                                RaisedButton(
                                                    onPressed: (){
                                                      showDialog(
                                                          context: context,
                                                          barrierDismissible: false,
                                                          builder: (context) {
                                                            return RatingDialog(
                                                              icon: const Icon(
                                                                Icons.star,
                                                                size: 100,
                                                                color: Colors.red,
                                                              ),
                                                              title: "Rate Your Teacher",
                                                              description: "Tap a star to give your rating.",
                                                              submitButton: "SUBMIT",
                                                              accentColor: Colors.red,
                                                              onSubmitPressed: (int rating) {
                                                                // TeachersReviewProvider().postReview(rating, comment, widget.reviewdata.staffid);
                                                              },
                                                            );
                                                          });
                                                    },
                                                    child: Text('Give Ratings')
                                                ),
                                              ],
                                            ) : Text('${widget.reviewdata.rating}'),
                                ),
                              ],
                            ),
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