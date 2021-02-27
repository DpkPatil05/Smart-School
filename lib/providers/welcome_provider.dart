import 'package:flutter/cupertino.dart';
import 'package:smart_school/hive_operations.dart';

class WelcomeProvider with ChangeNotifier {
  final String bgImage = 'assets/bg.jpg';
  final String schoolLogo = 'https://www.paperfree-erp.in/college/${HiveOperation().schoolSite}/uploads/school_content/logo/app_logo/1.png';
  final String bodyImage = 'assets/welcome-pic.png';
}