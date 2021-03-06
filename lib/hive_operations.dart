import 'package:hive/hive.dart';

class HiveOperation {
  Box studentBox = Hive.box('studentData');

  int studentID = Hive.box('studentData').get('sid');
  int vehicleId = Hive.box('studentData').get('vid');

  String vehicleNo = Hive.box('studentData').get('vno');
  String schoolSite = Hive.box('studentData').get('site');
  String schoolName = Hive.box('studentData').get('school');
  String schoolLogo = Hive.box('studentData').get('schoollogo');
}