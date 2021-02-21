import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/download_center.dart';
import 'package:smart_school/services/download.dart';

class DownloadCenterProvider with ChangeNotifier {
  String generalDownloadURL = 'http://www.paperfree-erp.in/college/demo-high-school/';

  toast(String msg) {
    return Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  generateDownload(String doc) => Download().startDownload(generalDownloadURL, doc);

  // ignore: missing_return
  Future<List<List<DownloadCenterData>>> fetchDownloadContent() async {
    String url = 'https://www.paperfree-erp.in/mobileapp/downloadcenter/assignment.php?studentid=${HiveOperation().studentID}';
    print('Download url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<List<DownloadCenterData>> downloadData = downloadCenterDataFromJson(response.body);
          return downloadData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          toast("Problem fetching data");
        }
      } catch(e) {toast("Problem fetching data");}
    } else toast("No Data connection");
  }

}