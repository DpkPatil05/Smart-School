/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/leave_data.dart';
import 'package:smart_school/providers/teachers_review_provider.dart';
import 'package:smart_school/tabs/hamItems/apply_leave.dart';

class PostReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<LeaveData>>.value(
      value: null,
      child: FutureBuilder<List<LeaveData>>(
        future: TeachersReviewProvider().postReviews(),
        builder: (BuildContext context, AsyncSnapshot<List<LeaveData>> leaveData) {
          switch (leaveData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return leaveData.hasError? Text('Error: ${leaveData.error}')
                  : ApplyLeave(leavedata: leaveData.data);
          }
        },
      ),
    );
  }
}*/
