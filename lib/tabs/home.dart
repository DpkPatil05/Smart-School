import 'package:flutter/material.dart';
import 'package:smart_school/pages/attendance.dart';
import 'package:smart_school/pages/my_pending_tasks.dart';
import 'package:smart_school/tabs/homework.dart';
import 'package:smart_school/utils/calender_view.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: 280.0,
            child: Calender()
        ),
        SizedBox(height: 10.0,),
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
                   body: Attendance(),
                 ),
                 ),
               );},
             child: const Text(
                 'Attendance',
                 style: TextStyle(
                     fontSize: 20.0,
                     color: Colors.white
                 )
             ),
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(18.0),
                 side: BorderSide(color: Colors.red)),
             color: Colors.red,
             height: 40.0,
             minWidth: 350.0,
           ),

           FlatButton(
             onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => Scaffold(
                   appBar: AppBar(
                     backgroundColor: Colors.red,
                     title: Text('Homework'),
                   ),
                   body: HomeworkTab(),
                 ),
                 ),
               );},
             child: const Text(
                 'Homework',
                 style: TextStyle(
                     fontSize: 20.0,
                     color: Colors.white
                 )
             ),
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(18.0),
                 side: BorderSide(color: Colors.red)),
             color: Colors.red,
             height: 40.0,
             minWidth: 350.0,
           ),
         ],
       )
      ],
    );
  }
}
