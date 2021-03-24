import 'package:flutter/cupertino.dart';

class EventsProvider with ChangeNotifier {
  String getData(String data, int type) {
    String returnData;
    List<String> content = data.split('DATASPTR');
    if(type == 0)
      returnData = content[0];
    else
      returnData = content[1];
    return returnData;
  }

}