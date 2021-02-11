import 'package:flutter/material.dart';
import 'package:smart_school/future/fetch_exam.dart';
import 'package:smart_school/future/fetch_fees.dart';
import 'package:smart_school/future/fetch_homework.dart';
import 'package:smart_school/future/fetch_notice.dart';
import 'package:smart_school/future/fetch_profile.dart';
import 'package:smart_school/future/fetch_syllabus.dart';
import 'package:smart_school/future/fetch_timetable.dart';
import 'package:smart_school/pages/attendance.dart';
import 'package:smart_school/tabs/hamItems/apply_leave.dart';
import 'package:smart_school/tabs/hamItems/hostels.dart';
import 'package:smart_school/tabs/hamItems/lesson_plan.dart';
import 'package:smart_school/tabs/hamItems/library.dart';
import 'package:smart_school/tabs/hamItems/online_exam.dart';
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
    ['Online Exam', '0xe8a6', '6'], ['Apply Leave', '0xe0b7', '7'], ['Attendance', '0xe8f9', '8'],
    ['Examination', '0xeb8f', '9'], ['Notice Board', '0xe658', '10'], ['Teachers Reviews', '0xe355', '11'],
    ['Library', '0xe927', '12'], ['Transport Route', '0xe990', '13'], ['Hostels', '0xe98f', '14'],
    ['Logout', '0xe848', '15']
  ];

  loadProfilePic(String path) => fetchProfilePic+path;

  Widget openPage(int index) {
    if(index == 0) return FetchProfile();
    if(index == 1) return FetchFees();
    if(index == 2) return FetchTimetable();
    if(index == 3) return LessonPlan();
    if(index == 4) return FetchSyllabus();
    if(index == 5) return FetchHomework();
    if(index == 6) return OnlineExam();
    if(index == 7) return ApplyLeave();
    // if(index == 8) return DownloadCenter();
    if(index == 8) return Attendance();
    if(index == 9) return FetchExam();
    if(index == 10) return FetchNotice();
    if(index == 11) return TeachersReview();
    if(index == 12) return Library();
    if(index == 13) return TransportRoute();
    if(index == 14) return Hostel();
    if(index == 15) return null;
    return null;
  }

}