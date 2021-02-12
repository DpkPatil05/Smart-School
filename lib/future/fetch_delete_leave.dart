import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/leave_upload_response.dart';
import 'package:smart_school/providers/apply_leave_provider.dart';

import 'fetch_leave.dart';

class FetchDeleteLeaveResponse extends StatefulWidget {
  final int leaveid;

  const FetchDeleteLeaveResponse({this.leaveid});

  @override
  _FetchDeleteLeaveResponseState createState() => _FetchDeleteLeaveResponseState();
}

class _FetchDeleteLeaveResponseState extends State<FetchDeleteLeaveResponse> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<LeaveUploadMessage>.value(
      value: null,
      child: FutureBuilder<LeaveUploadMessage>(
        future: ApplyLeaveProvider().deleteLeaveData(widget.leaveid),
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