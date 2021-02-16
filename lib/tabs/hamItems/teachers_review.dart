import 'package:flutter/material.dart';
import 'package:smart_school/modal/teachers_review.dart';
import 'package:smart_school/templates/teachers_review.dart';

class TeachersReview extends StatefulWidget {
  final List<TeacherReviewData> reviewdata;

  const TeachersReview({this.reviewdata});

  @override
  _TeachersReviewState createState() => _TeachersReviewState();
}

class _TeachersReviewState extends State<TeachersReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: 1 == widget.reviewdata.length ?
      Card(
        child: Center(
            child: Text(
              "No Reviews available",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
              ),
            )
        ),
      ):ListView.builder(
          itemCount: widget.reviewdata.length-1??0,
          itemBuilder: (context, index) {
            return TeachersReviewCard(reviewdata: widget.reviewdata[index]);
          })
    );
  }
}

