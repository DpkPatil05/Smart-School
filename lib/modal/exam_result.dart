import 'dart:convert';

List<ExamResult> examResultFromJson(String str) => List<ExamResult>.from(json.decode(str).map((x) => ExamResult.fromJson(x)));

String examResultToJson(List<ExamResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamResult {
  ExamResult({
    this.examtype,
    this.subject,
    this.passingMarks,
    this.marks,
    this.result,
    this.note,
    this.total,
    this.perct,
    this.success,
  });

  String examtype;
  String subject;
  String passingMarks;
  String marks;
  String result;
  String note;
  String total;
  int perct;
  String success;

  factory ExamResult.fromJson(Map<String, dynamic> json) => ExamResult(
    examtype: json["examtype"] == null ? null : json["examtype"],
    subject: json["subject"] == null ? null : json["subject"],
    passingMarks: json["passingMarks"] == null ? null : json["passingMarks"],
    marks: json["marks"] == null ? null : json["marks"],
    result: json["result"] == null ? null : json["result"],
    note: json["note"] == null ? null : json["note"],
    total: json["total"] == null ? null : json["total"],
    perct: json["perct"] == null ? null : json["perct"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "examtype": examtype == null ? null : examtype,
    "subject": subject == null ? null : subject,
    "passingMarks": passingMarks == null ? null : passingMarks,
    "marks": marks == null ? null : marks,
    "result": result == null ? null : result,
    "note": note == null ? null : note,
    "total": total == null ? null : total,
    "perct": perct == null ? null : perct,
    "success": success == null ? null : success,
  };
}