import 'dart:convert';

List<ExamSchedule> examScheduleFromJson(String str) => List<ExamSchedule>.from(json.decode(str).map((x) => ExamSchedule.fromJson(x)));

String examScheduleToJson(List<ExamSchedule> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamSchedule {
  ExamSchedule({
    this.subject,
    this.room,
    this.passingMarks,
    this.fullMarks,
    this.date,
    this.start,
    this.duration,
    this.success,
  });

  String subject;
  String room;
  String passingMarks;
  String fullMarks;
  String date;
  String start;
  String duration;
  String success;

  factory ExamSchedule.fromJson(Map<String, dynamic> json) => ExamSchedule(
    subject: json["subject"] == null ? null : json["subject"],
    room: json["Room"] == null ? null : json["Room"],
    passingMarks: json["passingMarks"] == null ? null : json["passingMarks"],
    fullMarks: json["fullMarks"] == null ? null : json["fullMarks"],
    date: json["date"] == null ? null : json["date"],
    start: json["start"] == null ? null : json["start"],
    duration: json["duration"] == null ? null : json["duration"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject == null ? null : subject,
    "Room": room == null ? null : room,
    "passingMarks": passingMarks == null ? null : passingMarks,
    "fullMarks": fullMarks == null ? null : fullMarks,
    "date": date == null ? null : date,
    "start": start == null ? null : start,
    "duration": duration == null ? null : duration,
    "success": success == null ? null : success,
  };
}
