import 'dart:convert';

List<HomeworkData> homeworkDataFromJson(String str) => List<HomeworkData>.from(json.decode(str).map((x) => HomeworkData.fromJson(x)));

String homeworkDataToJson(List<HomeworkData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeworkData {
  HomeworkData({
    this.completion,
    this.subject,
    this.description,
    this.hwdate,
    this.submitdate,
    this.evaldate,
    this.doc,
    this.evalby,
    this.success,
  });

  String completion;
  String subject;
  String description;
  String hwdate;
  String submitdate;
  String evaldate;
  String doc;
  String evalby;
  String success;

  factory HomeworkData.fromJson(Map<String, dynamic> json) => HomeworkData(
    completion: json["completion"] == null ? null : json["completion"],
    subject: json["subject"] == null ? null : json["subject"],
    description: json["description"] == null ? null : json["description"],
    hwdate: json["hwdate"] == null ? null : json["hwdate"],
    submitdate: json["submitdate"] == null ? null : json["submitdate"],
    evaldate: json["evaldate"] == null ? null : json["evaldate"],
    doc: json["doc"] == null ? null : json["doc"],
    evalby: json["evalby"] == null ? null : json["evalby"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "completion": completion == null ? null : completion,
    "subject": subject == null ? null : subject,
    "description": description == null ? null : description,
    "hwdate": hwdate == null ? null : hwdate,
    "submitdate": submitdate == null ? null : submitdate,
    "evaldate": evaldate == null ? null : evaldate,
    "doc": doc == null ? null : doc,
    "evalby": evalby == null ? null : evalby,
    "success": success == null ? null : success,
  };
}
