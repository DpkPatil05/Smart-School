import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'package:smart_school/pages/welcome.dart';
import 'package:smart_school/providers/apply_leave_provider.dart';
import 'package:smart_school/providers/attendance_provider.dart';
import 'package:smart_school/providers/class_timetable_provider.dart';
import 'package:smart_school/providers/exam_provider.dart';
import 'package:smart_school/providers/fees_provider.dart';
import 'package:smart_school/providers/homework_provider.dart';
import 'package:smart_school/providers/hostel_provider.dart';
import 'package:smart_school/providers/lesson_plan_provider.dart';
import 'package:smart_school/providers/library_provider.dart';
import 'package:smart_school/providers/login_provider.dart';
import 'package:smart_school/providers/my_documents_provider.dart';
import 'package:smart_school/providers/notice_provider.dart';
import 'package:smart_school/providers/online_exam_provider.dart';
import 'package:smart_school/providers/syllabus_provider.dart';
import 'package:smart_school/providers/teachers_review_provider.dart';
import 'package:smart_school/providers/transport_provider.dart';
import 'package:smart_school/providers/welcome_provider.dart';
import 'package:smart_school/providers/home_provider.dart';
import 'package:smart_school/providers/profile_provider.dart';
import 'package:smart_school/services/download.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.openBox('student');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WelcomeProvider()),
        ChangeNotifierProvider(create: (context) => MyDocumentsProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => FeesProvider()),
        ChangeNotifierProvider(create: (context) => HomeworkProvider()),
        ChangeNotifierProvider(create: (context) => SyllabusProvider()),
        ChangeNotifierProvider(create: (context) => TimetableProvider()),
        ChangeNotifierProvider(create: (context) => NoticeProvider()),
        ChangeNotifierProvider(create: (context) => ExamProvider()),
        ChangeNotifierProvider(create: (context) => AttendanceProvider()),
        ChangeNotifierProvider(create: (context) => OnlineExamProvider()),
        ChangeNotifierProvider(create: (context) => HostelProvider()),
        ChangeNotifierProvider(create: (context) => LibraryProvider()),
        ChangeNotifierProvider(create: (context) => TransportProvider()),
        ChangeNotifierProvider(create: (context) => LessonPlanProvider()),
        ChangeNotifierProvider(create: (context) => ApplyLeaveProvider()),
        ChangeNotifierProvider(create: (context) => TeachersReviewProvider()),
        ChangeNotifierProvider(create: (context) => Download()),
      ],
      child: MaterialApp(
          home: FutureBuilder(
              future: Hive.openBox('studentData'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.connectionState == ConnectionState.done ?
                snapshot.hasError ? Text(snapshot.error.toString())
                    : Welcome() : Scaffold();
              }
          )
      ),
    );
  }

  @override
  void dispose() {
    Hive.box('studentData').close();
    super.dispose();
  }
}
