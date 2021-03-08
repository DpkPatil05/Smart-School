import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/modal/login.dart';

class LoginProvider with ChangeNotifier{
  final String background = 'assets/bg.jpg';
  final String bodyImg1 = 'assets/graduated.png';

  String loginMsg = '';
  String user = '';
  String password = '';

  String login(String userName, String psw) {
    user = userName;
    password = psw;
    user == '' ? loginMsg = 'Please enter username' :
    password == '' ? loginMsg = 'Please enter password' : loginMsg = 'process';
    notifyListeners();
    return loginMsg;
  }

  toast(String msg) {
    Fluttertoast.showToast(
        msg: '$msg',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  // ignore: missing_return
  Future<LoginData> fetchUser() async {
    String url = 'https://www.paperfree-erp.in/mobileapp/login/login.php?username=$user&password=$password';
    print('Login url: ' + url);
    final response = await http.get(url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          return loginDataFromJson(response.body);
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          toast("Login error");
        }
      } catch(e) {
        toast("Login error");
        print("Login error: " + e.toString());
      }
    } else toast("No Data connection");
  }

}