import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Download with ChangeNotifier{
  bool downloading = false;

  String progress = "";

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

  Future<void> startDownload(String url, String doc) async {
    String downloadURL = url + doc;
    print('Download url: ' + downloadURL);
    Dio dio = Dio();
    try {
      // var dir = await getApplicationDocumentsDirectory();
      toast("Downloading");
      String path = await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DOWNLOADS);
      FileUtils.mkdir([path]);
      await dio.download(downloadURL, "$path/$doc", onReceiveProgress: (rec, total){
        progress = ((rec/total)*100).toStringAsFixed(0) + "%";
      }).then((value) {
        progress = "complete";
        print("Download Complete");
        toast("Download Complete");
      });
    } catch(e) {
      print("Download error: " + e.toString());
      toast("Download failed");
    }
  }
}