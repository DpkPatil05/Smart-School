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
  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_sharp),
                      SizedBox(width: 10.0),
                      Text(
                        '${widget.reviewdata.trName}(${widget.reviewdata.employeeid})',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                  "Class Teacher" == widget.reviewdata.classteacher.toString() ?
                  Card(
                    color: Colors.green,
                    child: Text("Class Teacher",
                    style: TextStyle(color: Colors.white)),
                  ) : SizedBox(width: 5.0),
                  IconButton(
                      iconSize: 25.0,
                      icon: Icon(Icons.preview_outlined),
                      tooltip: "View Details",
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) => SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Center(
                                    child: Text('Rating',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0
                                    )),
                                  ),
                                  subtitle: '0'==widget.reviewdata.rating?
                                  TextFormField(
                                    controller: commentController,
                                    textCapitalization: TextCapitalization.words,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      filled: false,
                                      labelText: 'Enter comment',
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ) : SizedBox(width: 10.0),
                                ),
                                '0'==widget.reviewdata.rating?
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: RaisedButton(
                                          color: Colors.red,
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
                                                    positiveComment: "We are so happy to hear :)",
                                                    negativeComment: "We're sad to hear :(",
                                                    submitButton: "SUBMIT",
                                                    accentColor: Colors.red,
                                                    onSubmitPressed: (int rating) {
                                                      TeachersReviewProvider()
                                                      .postReview(rating, commentController.text, widget.reviewdata.staffid);
                                                    },
                                                  );
                                                }
                                            );
                                          },
                                          child: Center(child: Text('Give Ratings',
                                            style: TextStyle(color: Colors.white)))
                                      ),
                                    ),
                                  ],
                                )
                                : Center(
                                  child: Text('${widget.reviewdata.rating}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0
                                      )
                                  ),
                                ),
                                SizedBox(height: 15.0),
                              ],
                            ),
                          )
                      )
                    // child: const Text('View'),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.call),
                  SizedBox(width: 10.0),
                  Text('${widget.reviewdata.phone}'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 10.0),
                  Text('${widget.reviewdata.email}'),
                ],
              ),
            ],
          ),
        )
    );
  }
}