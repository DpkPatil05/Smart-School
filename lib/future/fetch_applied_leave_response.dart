import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/leave_upload_response.dart';
import 'package:smart_school/providers/apply_leave_provider.dart';

import 'fetch_leave.dart';

class FetchAppliedLeaveResponse extends StatelessWidget {
  final DateTime fromdate, todate;
  final String reason;

  const FetchAppliedLeaveResponse({this.fromdate, this.todate, this.reason});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<LeaveUploadMessage>.value(
      value: null,
      child: FutureBuilder<LeaveUploadMessage>(
        future: ApplyLeaveProvider().uploadLeaveData(fromdate.toUtc(), todate.toUtc(), reason),
        builder: (BuildContext context, AsyncSnapshot<LeaveUploadMessage> leaveData) {
          switch (leaveData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return leaveData.hasError? Text('Error: ${leaveData.error}') : FetchLeave();
          }
        },
      ),
    );
  }
}