import 'dart:convert';

List<OnlineExamData> onlineExamDataFromJson(String str) => List<OnlineExamData>.from(json.decode(str).map((x) => OnlineExamData.fromJson(x)));

String onlineExamDataToJson(List<OnlineExamData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnlineExamData {
  OnlineExamData({
    this.exam,
    this.from,
    this.to,
    this.duration,
    this.totalAttempt,
    this.description,
    this.attempted,
    this.status,
    this.passing,
    this.success,
  });

  String exam;
  String from;
  String to;
  String duration;
  String totalAttempt;
  String description;
  int attempted;
  String status;
  String passing;
  String success;

  factory OnlineExamData.fromJson(Map<String, dynamic> json) => OnlineExamData(
    exam: json["exam"] == null ? null : json["exam"],
    from: json["from"] == null ? null : json["from"],
    to: json["to"] == null ? null : json["to"],
    duration: json["duration"] == null ? null : json["duration"],
    totalAttempt: json["totalAttempt"] == null ? null : json["totalAttempt"],
    description: json["description"] == null ? null : json["description"],
    attempted: json["attempted"] == null ? null : json["attempted"],
    status: json["status"] == null ? null : json["status"],
    passing: json["passing"] == null ? null : json["passing"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "exam": exam == null ? null : exam,
    "from": from == null ? null : from,
    "to": to == null ? null : to,
    "duration": duration == null ? null : duration,
    "totalAttempt": totalAttempt == null ? null : totalAttempt,
    "description": description == null ? null : description,
    "attempted": attempted == null ? null : attempted,
    "status": status == null ? null : status,
    "passing": passing == null ? null : passing,
    "success": success == null ? null : success,
  };
}
