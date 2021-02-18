import 'dart:convert';

List<ExamResult> examResultFromJson(String str) => List<ExamResult>.from(json.decode(str).map((x) => ExamResult.fromJson(x)));

String examResultToJson(List<ExamResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamResult {
  ExamResult({
    this.subject,
    this.grade,
    this.passingMarks,
    this.fullMarks,
    this.marks,
    this.note,
    this.total,
    this.marksObtained,
    this.perct,
    this.result,
    this.division,
    this.success,
  });

  String subject;
  String grade;
  String passingMarks;
  String fullMarks;
  String marks;
  String note;
  int total;
  int marksObtained;
  double perct;
  String result;
  String division;
  String success;

  factory ExamResult.fromJson(Map<String, dynamic> json) => ExamResult(
    subject: json["subject"] == null ? null : json["subject"],
    grade: json["grade"] == null ? null : json["grade"],
    passingMarks: json["passingMarks"] == null ? null : json["passingMarks"],
    fullMarks: json["fullMarks"] == null ? null : json["fullMarks"],
    marks: json["marks"] == null ? null : json["marks"],
    note: json["note"] == null ? null : json["note"],
    total: json["total"] == null ? null : json["total"],
    marksObtained: json["marks_obtained"] == null ? null : json["marks_obtained"],
    perct: json["perct"] == null ? null : json["perct"].toDouble(),
    result: json["result"] == null ? null : json["result"],
    division: json["division"] == null ? null : json["division"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject == null ? null : subject,
    "grade": grade == null ? null : grade,
    "passingMarks": passingMarks == null ? null : passingMarks,
    "fullMarks": fullMarks == null ? null : fullMarks,
    "marks": marks == null ? null : marks,
    "note": note == null ? null : note,
    "total": total == null ? null : total,
    "marks_obtained": marksObtained == null ? null : marksObtained,
    "perct": perct == null ? null : perct,
    "result": result == null ? null : result,
    "division": division == null ? null : division,
    "success": success == null ? null : success,
  };
}
