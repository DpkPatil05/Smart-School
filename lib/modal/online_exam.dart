import 'dart:convert';

List<OnlineExamData> onlineExamDataFromJson(String str) => List<OnlineExamData>.from(json.decode(str).map((x) => OnlineExamData.fromJson(x)));

String onlineExamDataToJson(List<OnlineExamData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnlineExamData {
  OnlineExamData({
    this.exam,
    this.from,
    this.to,
    this.attempt,
    this.description,
    this.attempted,
    this.status,
    this.success,
  });

  String exam;
  String from;
  String to;
  String attempt;
  String description;
  int attempted;
  String status;
  String success;

  factory OnlineExamData.fromJson(Map<String, dynamic> json) => OnlineExamData(
    exam: json["exam"] == null ? null : json["exam"],
    from: json["from"] == null ? null : json["from"],
    to: json["to"] == null ? null : json["to"],
    attempt: json["attempt"] == null ? null : json["attempt"],
    description: json["description"] == null ? null : json["description"],
    attempted: json["attempted"] == null ? null : json["attempted"],
    status: json["status"] == null ? null : json["status"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "exam": exam == null ? null : exam,
    "from": from == null ? null : from,
    "to": to == null ? null : to,
    "attempt": attempt == null ? null : attempt,
    "description": description == null ? null : description,
    "attempted": attempted == null ? null : attempted,
    "status": status == null ? null : status,
    "success": success == null ? null : success,
  };
}