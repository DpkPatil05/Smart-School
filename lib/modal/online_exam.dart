import 'dart:convert';

List<OnlineExamData> onlineExamDataFromJson(String str) => List<OnlineExamData>.from(json.decode(str).map((x) => OnlineExamData.fromJson(x)));

String onlineExamDataToJson(List<OnlineExamData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnlineExamData {
  OnlineExamData({
    this.englishClassTest,
    this.success,
  });

  EnglishClassTest englishClassTest;
  String success;

  factory OnlineExamData.fromJson(Map<String, dynamic> json) => OnlineExamData(
    englishClassTest: json["English Class Test"] == null ? null : EnglishClassTest.fromJson(json["English Class Test"]),
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "English Class Test": englishClassTest == null ? null : englishClassTest.toJson(),
    "success": success == null ? null : success,
  };
}

class EnglishClassTest {
  EnglishClassTest({
    this.from,
    this.to,
    this.attempt,
    this.description,
    this.attempted,
    this.status,
  });

  String from;
  String to;
  String attempt;
  String description;
  int attempted;
  String status;

  factory EnglishClassTest.fromJson(Map<String, dynamic> json) => EnglishClassTest(
    from: json["from"],
    to: json["to"],
    attempt: json["attempt"],
    description: json["description"],
    attempted: json["attempted"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "from": from,
    "to": to,
    "attempt": attempt,
    "description": description,
    "attempted": attempted,
    "status": status,
  };
}