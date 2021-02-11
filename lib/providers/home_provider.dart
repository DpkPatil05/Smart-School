import 'package:flutter/material.dart';
import 'package:smart_school/future/fetch_attendance.dart';
import 'package:smart_school/future/fetch_exam.dart';
import 'package:smart_school/future/fetch_fees.dart';
import 'package:smart_school/future/fetch_homework.dart';
import 'package:smart_school/future/fetch_hostel.dart';
import 'package:smart_school/future/fetch_notice.dart';
import 'package:smart_school/future/fetch_online_exam.dart';
import 'package:smart_school/future/fetch_profile.dart';
import 'package:smart_school/future/fetch_syllabus.dart';
import 'package:smart_school/future/fetch_timetable.dart';
import 'package:smart_school/tabs/hamItems/apply_leave.dart';
import 'package:smart_school/tabs/hamItems/download_center.dart';
import 'package:smart_school/tabs/hamItems/hostels.dart';
import 'package:smart_school/tabs/hamItems/lesson_plan.dart';
import 'package:smart_school/tabs/hamItems/library.dart';
import 'package:smart_school/tabs/hamItems/teachers_review.dart';
import 'package:smart_school/tabs/hamItems/transport_route.dart';


class HomeProvider with ChangeNotifier {
  int studentid;
  String userrole, firstlast, imgurl, classsection, standard;
  final String fetchProfilePic = 'http://www.paperfree-erp.in/college/demo-high-school/';
  final String defaultProfilePic = 'assets/profile.png';

  final List hamburgerItems = [
    ['Profile', '0xe900', '0'], ['Fees', '0xe87d', '1'], ['Class Timetable', '0xe623', '2'],
    ['Lesson Plan', '0xe5f6', '3'], ['Syllabus Status', '0xe80f', '4'], ['Homework','0xe868', '5'],
    ['Online Exam', '0xe8a6', '6'], ['Apply Leave', '0xe0b7', '7'], ['Download Center', '0xf189', '8'],
    ['Attendance', '0xe8f9', '9'], ['Examination', '0xeb8f', '10'], ['Notice Board', '0xe658', '11'],
    ['Teachers Reviews', '0xe355', '12'], ['Library', '0xe927', '13'], ['Transport Route', '0xe990', '14'],
    ['Hostels', '0xe98f', '15'], ['Logout', '0xe848', '16']
  ];

  loadProfilePic(String path) => fetchProfilePic+path;

  Widget openPage(int index) {
    if(index == 0) return FetchProfile();
    if(index == 1) return FetchFees();
    if(index == 2) return FetchTimetable();
    if(index == 3) return LessonPlan();
    if(index == 4) return FetchSyllabus();
    if(index == 5) return FetchHomework();
    if(index == 6) return FetchOnlineExam();
    if(index == 7) return ApplyLeave();
    if(index == 8) return DownloadCenter();
    if(index == 9) return FetchAttendance();
    if(index == 10) return FetchExam();
    if(index == 11) return FetchNotice();
    if(index == 12) return TeachersReview();
    if(index == 13) return Library();
    if(index == 14) return TransportRoute();
    if(index == 15) return FetchHostel();
    if(index == 16) return null;
    return null;
  }

}