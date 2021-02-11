import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/hostel.dart';
import 'package:smart_school/modal/hostel_detail_data.dart';

class HostelProvider with ChangeNotifier {
  String url = '';

  // ignore: missing_return
  Future<List<HostelData>> fetchHostel() async {
    url = 'https://www.paperfree-erp.in/mobileapp/hostel/hostel.php?studentid=${HiveOperation().studentID}';
    print('Hostel data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<HostelData> hostelData = hostelDataFromJson(response.body);
          return hostelData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<HostelData>();
        }
      } catch(e) {
        Fluttertoast.showToast(
            msg: "Problem fetching data",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } else {
      Fluttertoast.showToast(
          msg: "No Data connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  // ignore: missing_return
  Future<List<HostelDetailsData>> fetchHostelDetails(int hostelID) async {
    url = 'https://www.paperfree-erp.in/mobileapp/hostelview/hostel.php?hostelid=$hostelID&studentid=${HiveOperation().studentID}';
    print('Hostel detail data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<HostelDetailsData> hostelDetailData = hostelDetailsDataFromJson(response.body);
          return hostelDetailData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<HostelDetailsData>();
        }
      } catch(e) {
        Fluttertoast.showToast(
            msg: "Problem fetching data",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } else {
      Fluttertoast.showToast(
          msg: "No Data connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


}