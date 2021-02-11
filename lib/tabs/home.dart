import 'package:flutter/material.dart';
import 'package:smart_school/future/fetch_attendance.dart';
import 'package:smart_school/future/fetch_homework.dart';
import 'package:smart_school/pages/settings.dart';
import 'package:smart_school/utils/calender_view.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: 380.0,
              child: Calender()
          ),
          SizedBox(height: 50.0,),
         Column(
           children: [
             FlatButton(
               onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Scaffold(
                     appBar: AppBar(
                       backgroundColor: Colors.red,
                       title: Text('Attendance'),
                     ),
                     body: FetchAttendance(),
                   ),
                   ),
                 );},
               child: const Text(
                   'Attendance',
                   style: TextStyle(
                       fontSize: 25.0,
                       color: Colors.white
                   )
               ),
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(18.0),
                   side: BorderSide(color: Colors.red)),
               color: Colors.red,
               height: 50.0,
               minWidth: 350.0,
             ),
             SizedBox(height: 10.0),
             FlatButton(
               onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Scaffold(
                     appBar: AppBar(
                       backgroundColor: Colors.red,
                       title: Text('Homework'),
                     ),
                     body: FetchHomework(),
                   ),
                   ),
                 );},
               child: const Text(
                   'Homework',
                   style: TextStyle(
                       fontSize: 25.0,
                       color: Colors.white
                   )
               ),
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(18.0),
                   side: BorderSide(color: Colors.red)),
               color: Colors.red,
               height: 50.0,
               minWidth: 350.0,
             ),
             SizedBox(height: 50.0),
             FloatingActionButton(
               backgroundColor: Colors.red,
               foregroundColor: Colors.black,
               onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Scaffold(
                     appBar: AppBar(
                       backgroundColor: Colors.red,
                       title: Text('Homework'),
                     ),
                     body: Settings(),
                   ),
                   ),
                 );
               },
               child: Icon(Icons.settings),
             )
           ],
         )
        ],
      ),
    );
  }
}
