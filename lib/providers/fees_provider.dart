import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:smart_school/modal/fees.dart';
import 'package:smart_school/hive_operations.dart';

class FeesProvider with ChangeNotifier {
  String url = '';
  Map<String, double> grandTotal = {};

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

  // ignore: missing_return
  Future<List<List<FeesData>>> fetchFees() async {
    url = 'https://www.paperfree-erp.in/mobileapp/fees/fees.php?studentid=${HiveOperation().studentID}';
    print('Fees data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<List<FeesData>> feeData = feesDataFromJson(response.body);
          return feeData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          toast("Problem fetching data");
        }
      } catch(e) {
        toast("Problem fetching data");
      }
    } else toast("No Data connection");
  }

  grandTotalData(List<List<FeesData>> feedata) async{
    double totalAmount = 0.0, totalDiscount = 0.0, totalFine = 0.0,
        totalPaid = 0.0, totalBalance = 0.0;
    for(int i=0; i<feedata.length-1; i++){
      totalAmount = totalAmount +
          double.parse(feedata[i][feedata[i].length-1].amount.replaceAll(',', ''));
        if (feedata[i].length-1 == 0) {
          totalBalance = totalBalance +
              double.parse(
                  feedata[i][feedata[i].length-1].amount.replaceAll(',', ''));
        } else {
          totalBalance = totalBalance +
              double.parse(
                  feedata[i][feedata[i].length-2].balanceamt.replaceAll(
                      ',', ''));
        }
    }
    grandTotal['amount'] = totalAmount;

    for(int i=0; i<feedata.length; i++){
      for(int j=0; j<feedata[i].length-1; j++){
        totalDiscount = totalDiscount +
            double.parse(feedata[i][j].discnt.replaceAll(',', ''));
        totalFine = totalFine +
            double.parse(feedata[i][j].fine.replaceAll(',', ''));
        totalPaid = totalPaid +
            double.parse(feedata[i][j].paidamt.replaceAll(',', ''));
      }
    }

    grandTotal['discount'] = totalDiscount;
    grandTotal['fine'] = totalFine;
    grandTotal['paid'] = totalPaid;
    grandTotal['balance'] = totalBalance;
  }

}