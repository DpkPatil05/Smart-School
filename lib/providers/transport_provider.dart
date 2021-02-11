import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_school/modal/transport.dart';
import 'package:http/http.dart' as http;

import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/transport_details.dart';

class TransportProvider with ChangeNotifier {
  String url = '';

  // ignore: missing_return
  Future<TransportData> fetchTransport() async {
    url = 'http://www.paperfree-erp.in/mobileapp/transport/transport.php?studentid=${HiveOperation().studentID}';
    print('Transport data url: ' + url);
    final response = await http.get(url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          return transportDataFromJson(response.body);
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return transportDataFromJson(response.body);
        }
      } catch (e) {
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
  Future<List<TransportDetailsData>> fetchTransportDetails(String vehicleID) async {
    url = 'https://www.paperfree-erp.in/mobileapp/transportview/transport.php?vehicleid=$vehicleID}';
    print('Transport data url: ' + url);
    final response = await http.get(url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<TransportDetailsData> transportData = transportDetailsDataFromJson(response.body);
          return transportData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<TransportDetailsData>();
        }
      } catch (e) {
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