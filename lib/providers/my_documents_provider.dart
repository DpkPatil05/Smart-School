import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/my_documents.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/services/download.dart';

class MyDocumentsProvider with ChangeNotifier {
  String generalDownloadURL = 'https://www.paperfree-erp.in/college/'
      '${HiveOperation().schoolSite}/uploads/student_documents/${HiveOperation().studentID}/';

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

  generateDownload(String doc) => Download().startDownload(generalDownloadURL, doc);

  // ignore: missing_return
  Future<List<MyDocumentsData>> fetchDocuments() async {
    String url = 'http://www.paperfree-erp.in/mobileapp/mydocuments/mydocuments.php?studentid=${HiveOperation().studentID}';
    print('My Documents url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<MyDocumentsData> feeData = myDocumentsDataFromJson(response.body);
          return feeData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return List<MyDocumentsData>();
        }
      } catch(e) {
        toast("Problem fetching data");
      }
    } else {
      toast("No Data connection");
    }
  }


}