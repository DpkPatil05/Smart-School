import 'dart:convert';

List<LessonPlanData> lessonPlanDataFromJson(String str) => List<LessonPlanData>.from(json.decode(str).map((x) => LessonPlanData.fromJson(x)));

String lessonPlanDataToJson(List<LessonPlanData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonPlanData {
  LessonPlanData({
    this.day,
    this.subject,
    this.roomno,
    this.timeFrom,
    this.timeTo,
    this.success,
  });

  String day;
  String subject;
  String roomno;
  String timeFrom;
  String timeTo;
  String success;

  factory LessonPlanData.fromJson(Map<String, dynamic> json) => LessonPlanData(
    day: json["day"] == null ? null : json["day"],
    subject: json["subject"] == null ? null : json["subject"],
    roomno: json["roomno"] == null ? null : json["roomno"],
    timeFrom: json["time_from"] == null ? null : json["time_from"],
    timeTo: json["time_to"] == null ? null : json["time_to"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "day": day == null ? null : day,
    "subject": subject == null ? null : subject,
    "roomno": roomno == null ? null : roomno,
    "time_from": timeFrom == null ? null : timeFrom,
    "time_to": timeTo == null ? null : timeTo,
    "success": success == null ? null : success,
  };
}
