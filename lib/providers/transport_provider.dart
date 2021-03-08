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

  toast(msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  int getVehicleData(List<TransportData> tdata) {
    int vehicleId;
    String vehicleNo;
    if (tdata != null) {
      for (int i = 0; i < tdata.length - 1; i++) {
        if (tdata[i].vehicleAssigned == "assigned") {
          vehicleId = int.parse(tdata[i].id);
          vehicleNo = tdata[i].vehicleNo;
        }
      }
    }
    HiveOperation().studentBox.put('vid', vehicleId);
    HiveOperation().studentBox.put('vno', vehicleNo);
    return vehicleId;
  }

  // ignore: missing_return
  Future<List<TransportData>> fetchTransport() async {
    url = 'https://www.paperfree-erp.in/mobileapp/transport/transport.php?studentid=${HiveOperation().studentID}';
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
        toast("Problem fetching data");
      }
    } else {
      toast("No Data connection");
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
        // toast("Problem fetching transport data");
      }
    } else {
      toast("No Data connection");

    }
  }
}