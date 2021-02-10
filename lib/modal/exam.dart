import 'dart:convert';

List<Exam> examFromJson(String str) => List<Exam>.from(json.decode(str).map((x) => Exam.fromJson(x)));

String examToJson(List<Exam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exam {
  Exam({
    this.examId,
    this.type,
    this.success,
  });

  String examId;
  String type;
  String success;

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
    examId: json["examID"] == null ? null : json["examID"],
    type: json["type"] == null ? null : json["type"],
    success: json["success"] == null ? null : json["success"],
  );
  Map<String, dynamic> toJson() => {
    "examID": examId == null ? null : examId,
    "type": type == null ? null : type,
    "success": success == null ? null : success,
  };
}
