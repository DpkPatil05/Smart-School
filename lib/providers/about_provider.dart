import 'package:flutter/cupertino.dart';
import 'package:smart_school/hive_operations.dart';

class AboutProvider with ChangeNotifier {
  String schoolLogo = 'https://www.paperfree-erp.in/college/${HiveOperation().schoolSite}'
      '/uploads/school_content/logo/${HiveOperation().schoolLogo}';
  List<String> devNameList = [
    'Deepak Patil',
    'Pragati Naik',
    'Vishaal Nair',
  ];

  List<String> devURLList = [
    'https://www.linkedin.com/in/deepak-patil-1288b4b7/',
    'https://www.linkedin.com/in/pragati-naik-8b948a1aa/',
    'https://www.linkedin.com/in/vishaal-nair-5282a81b6/',
  ];

}