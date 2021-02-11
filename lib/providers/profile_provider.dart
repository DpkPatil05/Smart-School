import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:smart_school/modal/profile.dart';

import 'package:smart_school/hive_operations.dart';

class ProfileProvider with ChangeNotifier {
  final String defaultProfilePic = 'assets/profile.png';
  final String fetchPics = 'http://www.paperfree-erp.in/college/demo-high-school/';

  String url = '';


  String getImageUrl(String path) => fetchPics+path;

  // ignore: missing_return
  Future<ProfileData> fetchUser() async {
    url = 'http://www.paperfree-erp.in/mobileapp/profile/profile.php?studentid=${HiveOperation().studentID}';
    print('Profile data url: ' + url);
    final response = await http.get(url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          return profileDataFromJson(response.body);
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          return profileDataFromJson(response.body);
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