import 'dart:convert';

List<SyllabusData> syllabusDataFromJson(String str) => List<SyllabusData>.from(json.decode(str).map((x) => SyllabusData.fromJson(x)));

String syllabusDataToJson(List<SyllabusData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SyllabusData {
  SyllabusData({
    this.lessonname,
    this.description,
    this.completion,
    this.date,
    this.success,
  });

  String lessonname;
  String description;
  String completion;
  String date;
  String success;

  factory SyllabusData.fromJson(Map<String, dynamic> json) => SyllabusData(
    lessonname: json["lessonname"] == null ? null : json["lessonname"],
    description: json["description"] == null ? null : json["description"],
    completion: json["completion"] == null ? null : json["completion"],
    date: json["date"] == null ? null : json["date"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "lessonname": lessonname == null ? null : lessonname,
    "description": description == null ? null : description,
    "completion": completion == null ? null : completion,
    "date": date == null ? null : date,
    "success": success == null ? null : success,
  };
}
