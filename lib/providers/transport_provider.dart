import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/transport.dart';
import 'package:smart_school/modal/transport_details.dart';

class TransportProvider with ChangeNotifier {
  String url = '';

  int getVehicleId(List<TransportData> tdata) {
    int vehicleID;
    if (tdata != null) {
      for (int i = 0; i < tdata.length - 1; i++) {
        if (tdata[i].vehicleAssigned == "assigned")
          vehicleID = int.parse(tdata[i].id);
      }
    }
    return vehicleID;
  }

  // ignore: missing_return
  Future<List<TransportData>> fetchTransport() async {
    url = 'http://www.paperfree-erp.in/mobileapp/transport/transport.php?studentid=${HiveOperation().studentID}';
    print('Transport data url: ' + url);
    final response = await http.get(url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<TransportData> transportData = transportDataFromJson(response.body);
          return transportData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<TransportData>();
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
  Future<TransportDetailsData> fetchTransportDetails(int vehicleID) async {
    url = 'https://www.paperfree-erp.in/mobileapp/transportview/transport.php?vehicleid=$vehicleID}';
    print('Transport detail data url: ' + url);
    final response = await http.get(url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final TransportDetailsData transportDetailData = transportDetailsDataFromJson(response.body);
          return transportDetailData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return null;
        }
      } catch (e) {
        print("Problem fetching transport data: ${e.toString()}");
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