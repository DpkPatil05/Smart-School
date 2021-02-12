import 'dart:convert';

List<List<LessonPlanData>> lessonPlanDataFromJson(String str) => List<List<LessonPlanData>>.from(json.decode(str).map((x) => List<LessonPlanData>.from(x.map((x) => LessonPlanData.fromJson(x)))));

String lessonPlanDataToJson(List<List<LessonPlanData>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class LessonPlanData {
  LessonPlanData({
    this.day,
    this.subject,
    this.roomno,
    this.timeFrom,
    this.timeTo,
  });

  String day;
  String subject;
  String roomno;
  String timeFrom;
  String timeTo;

  factory LessonPlanData.fromJson(Map<String, dynamic> json) => LessonPlanData(
    day: json["day"],
    subject: json["subject"],
    roomno: json["roomno"],
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "subject": subject,
    "roomno": roomno,
    "time_from": timeFrom,
    "time_to": timeTo,
  };
}
