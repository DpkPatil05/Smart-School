import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/future/fetch_applied_leave_response.dart';
import 'package:smart_school/future/fetch_delete_leave.dart';
import 'package:smart_school/modal/leave_data.dart';
import 'package:smart_school/modal/leave_upload_response.dart';

import 'package:smart_school/hive_operations.dart';



class ApplyLeaveProvider with ChangeNotifier {
  String url = '';

  toast(String msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Widget saveLeave(DateTime fromdate, DateTime todate, String reason) {
    return FetchAppliedLeaveResponse(fromdate: fromdate, todate: todate, reason: reason);
  }

  Widget delete(int id) => FetchDeleteLeaveResponse(leaveid: id);

  // ignore: missing_return
  Future<LeaveUploadMessage> uploadLeaveData(DateTime fromdate, DateTime todate, String reason) async {
    var fromDateToSend = "${fromdate.year}-${fromdate.month}-${fromdate.day}";
    var toDateToSend = "${todate.year}-${todate.month}-${todate.day}";
    url = 'http://www.paperfree-erp.in/mobileapp/applyleave/applyleave.php?studentid='
        '${HiveOperation().studentID}&fdate=$fromDateToSend&tdate=$toDateToSend&reason=${reason.replaceAll(" ", "%20")}';
    print('Upload Leave url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          return leaveUploadMessageFromJson(response.body);
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          toast("Problem uploading data");
        }
      } catch(e) {
        toast("Problem uploading data");
      }
    } else {
      toast("No Data connection");
    }
  }

  // ignore: missing_return
  Future<LeaveUploadMessage> deleteLeaveData(int id) async {
    url = 'http://www.paperfree-erp.in/mobileapp/applyleave/applyleave.php?leaveid=$id';
    print('Delete Leave url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          return leaveUploadMessageFromJson(response.body);
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          toast("Problem deleting data");
        }
      } catch(e) {
        toast("Problem uploading data");
      }
    } else {
      toast("No Data connection");
    }
  }

  // ignore: missing_return
  Future<List<LeaveData>> fetchLeaveData() async {
    url = 'http://www.paperfree-erp.in/mobileapp/applyleave/applyleave.php?studentid=${HiveOperation().studentID}';
    print('Apply Leave fetch url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<LeaveData> leaveData = leaveDataFromJson(response.body);
          return leaveData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<LeaveData>();
        }
      } catch(e) {
        toast("Problem uploading data");
      }
    } else {
      toast("No Data connection");
    }
  }

}