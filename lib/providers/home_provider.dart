import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_school/future/fetch_attendance.dart';
import 'package:smart_school/future/fetch_download_center.dart';
import 'package:smart_school/future/fetch_exam.dart';
import 'package:smart_school/future/fetch_fees.dart';
import 'package:smart_school/future/fetch_homework.dart';
import 'package:smart_school/future/fetch_hostel.dart';
import 'package:smart_school/future/fetch_leave.dart';
import 'package:smart_school/future/fetch_library.dart';
import 'package:smart_school/future/fetch_my_documents.dart';
import 'package:smart_school/future/fetch_notice.dart';
import 'package:smart_school/future/fetch_online_exam.dart';
import 'package:smart_school/future/fetch_profile.dart';
import 'package:smart_school/future/fetch_syllabus.dart';
import 'package:smart_school/future/fetch_teachers_review.dart';
import 'package:smart_school/future/fetch_timeline.dart';
import 'package:smart_school/future/fetch_timetable.dart';
import 'package:smart_school/future/fetch_transport_routes.dart';
import 'package:smart_school/future/fetch_lesson_plan.dart';
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/calender_events.dart';
import 'package:smart_school/tabs/hamItems/about_us.dart';
import 'package:http/http.dart' as http;


class HomeProvider with ChangeNotifier {
  int studentid;
  String userrole, firstlast, imgurl, classsection, standard;
  final String linkedinlogo = 'assets/linkedin.png';
  final String fetchProfilePic = 'https://www.paperfree-erp.in/college/${HiveOperation().schoolSite}/';
  final String defaultProfilePic = 'assets/profile.png';


  final List hamburgerItems = [
    ['Profile', '0xe900', '0'], ['Timeline', '0xea7e', '1'], ['My Documents', '0xe75f', '2'],
    ['Fees', '0xe87d', '3'], ['Class Timetable', '0xe623', '4'], ['Lesson Plan', '0xe5f6', '5'],
    ['Syllabus Status', '0xe80f', '6'], ['Homework','0xe868', '7'],
    ['Online Exam', '0xe8a6', '8'], ['Apply Leave', '0xe0b7', '9'], ['Download Center', '0xf189', '10'],
    ['Attendance', '0xe8f9', '11'], ['Examination', '0xeb8f', '12'], ['Notice Board', '0xe658', '13'],
    ['Teachers Reviews', '0xe355', '14'], ['Library', '0xe927', '15'], ['Transport Route', '0xe990', '16'],
    ['Hostels', '0xe98f', '17'],  ['About Us', '0xe7d9', '18'], ['Logout', '0xe848', '19']
  ];

  logoutFunction(BuildContext context) {
    HiveOperation().studentBox.delete('sid');
    Navigator.of(context).pop(false);
    Navigator.of(context).pop(false);
  }

  String loadProfilePic(String path) => fetchProfilePic+path;

  toast(String msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  // ignore: missing_return
  Future<List<EventData>> fetchEvents() async {
    String url = 'https://www.paperfree-erp.in/mobileapp/events/events.php?'
        'studentid=${HiveOperation().studentID}';
    print('Events data url: ' + url);
    bool result = await DataConnectionChecker().hasConnection;
    if (result) {
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.=
          final List<EventData> eventsData = eventDataFromJson(response.body);
          return eventsData;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          toast("Problem fetching data");
        }
      } catch(e) {
        toast("Problem fetching data");
      }
    } else toast("No Data connection");
  }

  Widget openPage(int index) {
    if(index == 0) return FetchProfile();
    if(index == 1) return FetchTimeline();
    if(index == 2) return FetchMyDocuments();
    if(index == 3) return FetchFees();
    if(index == 4) return FetchTimetable();
    if(index == 5) return FetchLessonPlan();
    if(index == 6) return FetchSyllabus();
    if(index == 7) return FetchHomework();
    if(index == 8) return FetchOnlineExam();
    if(index == 9) return FetchLeave();
    if(index == 10) return FetchDownloadCenter();
    if(index == 11) return FetchAttendance();
    if(index == 12) return FetchExam();
    if(index == 13) return FetchNotice();
    if(index == 14) return FetchTeachersReview();
    if(index == 15) return FetchLibrary();
    if(index == 16) return FetchTransportRoutes();
    if(index == 17) return FetchHostel();
    if(index == 18) return AboutUs();
    return null;
  }

}