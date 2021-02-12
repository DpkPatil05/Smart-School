import 'dart:convert';

List<List<TimetableData>> timetableDataFromJson(String str) => List<List<TimetableData>>.from(json.decode(str).map((x) => List<TimetableData>.from(x.map((x) => TimetableData.fromJson(x)))));

String timetableDataToJson(List<List<TimetableData>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class TimetableData {
  TimetableData({
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

  factory TimetableData.fromJson(Map<String, dynamic> json) => TimetableData(
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