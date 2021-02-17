import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:file_utils/file_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/my_documents.dart';
import 'package:http/http.dart' as http;

class MyDocumentsProvider with ChangeNotifier {
  bool downloading = false;

  String progress = "";
  String generalDownloadURL = 'http://www.paperfree-erp.in/college/demo-high-school/uploads/'
      'student_documents/${HiveOperation().studentID}/';

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

  Future<void> checkStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isUndetermined) {
      // You can request multiple permissions at once.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      print(statuses[Permission.storage]);
    }
    if(await Permission.storage.isDenied) toast('Permission denied');
  }

  Future<void> startDownload(String doc) async {
    String downloadURL = generalDownloadURL + doc;
    print('Download url: ' + downloadURL);
    Dio dio = Dio();
    try {
      // var dir = await getApplicationDocumentsDirectory();
      String path = await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DOWNLOADS);
      FileUtils.mkdir([path]);
      await dio.download(downloadURL, "$path/$doc", onReceiveProgress: (rec, total){
        downloading = true;
        progress = ((rec/total)*100).toStringAsFixed(0) + "%";
        notifyListeners();
      }).then((value) {
        downloading = false;
        progress = "complete";
        print("Download Complete");
        toast("Download Complete");
        notifyListeners();
      });
    } catch(e) {
      downloading = false;
      notifyListeners();
      print("Download error: " + e.toString());
      toast("Download failed");
    }
  }

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