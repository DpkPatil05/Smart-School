import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/teachers_review_response.dart';
import 'package:smart_school/providers/teachers_review_provider.dart';

class PostReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<PostReviewResponse>.value(
      value: null,
      child: FutureBuilder<PostReviewResponse>(
        future: TeachersReviewProvider().postReviews(),
        builder: (BuildContext context, AsyncSnapshot<PostReviewResponse> leaveData) {
          switch (leaveData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return leaveData.hasError? Text('Error: ${leaveData.error}')
                  : Fluttertoast.showToast(
                  msg: 'Review added',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.blueGrey,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
          }
        },
      ),
    );
  }
}
