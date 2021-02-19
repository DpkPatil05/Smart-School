import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/teachers_review_response.dart';
import 'package:smart_school/providers/teachers_review_provider.dart';

import 'fetch_teachers_review.dart';

class PostReview extends StatelessWidget {
  final int rating;
  final String staffid, comment;

  const PostReview({this.rating, this.comment, this.staffid});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<PostReviewResponse>.value(
      value: null,
      child: FutureBuilder<PostReviewResponse>(
        future: TeachersReviewProvider().postReviews(rating, int.parse(staffid), comment),
        builder: (BuildContext context, AsyncSnapshot<PostReviewResponse> leaveData) {
          switch (leaveData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return leaveData.hasError? Text('Error: ${leaveData.error}')
                  : FetchTeachersReview();
          }
        },
      ),
    );
  }
}
