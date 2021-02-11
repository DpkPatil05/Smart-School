// To parse this JSON data, do
//
//     final homeworkData = homeworkDataFromJson(jsonString);

import 'dart:convert';

List<HomeworkData> homeworkDataFromJson(String str) => List<HomeworkData>.from(json.decode(str).map((x) => HomeworkData.fromJson(x)));

String homeworkDataToJson(List<HomeworkData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeworkData {
  HomeworkData({
    this.subject,
    this.description,
    this.hwdate,
    this.submitdate,
    this.evaldate,
    this.completion,
    this.success,
  });

  String subject;
  String description;
  String hwdate;
  String submitdate;
  String evaldate;
  String completion;
  String success;

  factory HomeworkData.fromJson(Map<String, dynamic> json) => HomeworkData(
    subject: json["subject"] == null ? null : json["subject"],
    description: json["description"] == null ? null : json["description"],
    hwdate: json["hwdate"] == null ? null : json["hwdate"],
    submitdate: json["submitdate"] == null ? null : json["submitdate"],
    evaldate: json["evaldate"] == null ? null : json["evaldate"],
    completion: json["completion"] == null ? null : json["completion"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject == null ? null : subject,
    "description": description == null ? null : description,
    "hwdate": hwdate == null ? null : hwdate,
    "submitdate": submitdate == null ? null : submitdate,
    "evaldate": evaldate == null ? null : evaldate,
    "completion": completion == null ? null : completion,
    "success": success == null ? null : success,
  };
}
