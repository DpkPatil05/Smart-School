import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeworkProvider with ChangeNotifier {
  String userId;

  bool loading = false;

  // Future<LoginData> data;

  String loadData(String user) {
    userId = user;
    // data = fetchUser();
  }

  /*Future<LoginData> fetchUser() async {
    String url = 'http://www.paperfree-erp.in/mobileapp/homework/homework.php?studentid=$userId';
    print('login url: ' + url);
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
          loading = false;
          return loginDataFromJson(response.body);
        }
      } catch (e) {}
    } else {
    }
  }*/

}