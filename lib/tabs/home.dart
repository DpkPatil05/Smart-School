import 'package:flutter/material.dart';
import 'package:smart_school/future/fetch_attendance.dart';
import 'package:smart_school/future/fetch_events.dart';
import 'package:smart_school/pages/todo.dart';

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
              height: 460.0,
              child: FetchEvents()
          ),
          SizedBox(height: 50.0),
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
                     )),
                   );
                  },
                 child: const Text(
                     'Attendance',
                     style: TextStyle(
                         fontSize: 20.0,
                         color: Colors.white
                     )
                 ),
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(18.0),
                     side: BorderSide(color: Colors.red)
                 ),
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
                         title: Text('To Do'),
                       ),
                       body: Todo(),
                     ),
                     ),
                   );
                   },
                 child: const Text(
                     'To Do',
                     style: TextStyle(
                         fontSize: 20.0,
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
             ],
           )
        ],
      ),
    );
  }
}
