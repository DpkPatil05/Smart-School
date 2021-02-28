import 'dart:convert';

List<SyllabusData> syllabusDataFromJson(String str) => List<SyllabusData>.from(json.decode(str).map((x) => SyllabusData.fromJson(x)));

String syllabusDataToJson(List<SyllabusData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SyllabusData {
  SyllabusData({
    this.subject,
    this.lesson,
    this.topic,
    this.completion,
    this.date,
    this.subperct,
  });

  String subject;
  String lesson;
  String topic;
  String completion;
  String date;
  int subperct;

  factory SyllabusData.fromJson(Map<String, dynamic> json) => SyllabusData(
    subject: json["subject"],
    lesson: json["lesson"],
    topic: json["topic"],
    completion: json["completion"],
    date: json["date"],
    subperct: json["subperct"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject,
    "lesson": lesson,
    "topic": topic,
    "completion": completion,
    "date": date,
    "subperct": subperct,
  };
}
