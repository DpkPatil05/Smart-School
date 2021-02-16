import 'package:hive/hive.dart';

class HiveOperation {
  Box studentBox = Hive.box('studentData');

  int studentID = Hive.box('studentData').get('sid');
  int vehicleID = Hive.box('studentData').get('vid');
}