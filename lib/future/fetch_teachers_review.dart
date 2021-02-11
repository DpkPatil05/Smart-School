import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_school/modal/teachers_review.dart';
import 'package:smart_school/providers/teachers_review_provider.dart';
import 'package:smart_school/tabs/hamItems/teachers_review.dart';

class FetchTeachersReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TeacherReviewData>>.value(
      value: null,
      child: FutureBuilder<List<TeacherReviewData>>(
        future: TeachersReviewProvider().fetchReviews(),
        builder: (BuildContext context, AsyncSnapshot<List<TeacherReviewData>> reviewData) {
          switch (reviewData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return reviewData.hasError? Text('Error: ${reviewData.error}')
                  : TeachersReview(reviewdata: reviewData.data);
          }
        },
      ),
    );
  }
}