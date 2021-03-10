// To parse this JSON data, do
//
//     final onlineExamData = onlineExamDataFromJson(jsonString);

import 'dart:convert';

List<List<OnlineExamData>> onlineExamDataFromJson(String str) => List<List<OnlineExamData>>.from(json.decode(str).map((x) => List<OnlineExamData>.from(x.map((x) => OnlineExamData.fromJson(x)))));

String onlineExamDataToJson(List<List<OnlineExamData>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class OnlineExamData {
  OnlineExamData({
    this.optA,
    this.optB,
    this.optC,
    this.optD,
    this.optE,
    this.question,
    this.qusid,
    this.answer,
    this.examid,
    this.exam,
    this.from,
    this.to,
    this.duration,
    this.totalAttempt,
    this.description,
    this.attempted,
    this.status,
    this.passing,
  });

  String optA;
  String optB;
  String optC;
  String optD;
  String optE;
  String question;
  String qusid;
  Answer answer;
  String examid;
  String exam;
  String from;
  String to;
  String duration;
  String totalAttempt;
  String description;
  int attempted;
  String status;
  String passing;

  factory OnlineExamData.fromJson(Map<String, dynamic> json) => OnlineExamData(
    optA: json["optA"] == null ? null : json["optA"],
    optB: json["optB"] == null ? null : json["optB"],
    optC: json["optC"] == null ? null : json["optC"],
    optD: json["optD"] == null ? null : json["optD"],
    optE: json["optE"] == null ? null : json["optE"],
    question: json["question"] == null ? null : json["question"],
    qusid: json["qusid"] == null ? null : json["qusid"],
    answer: json["answer"] == null ? null : answerValues.map[json["answer"]],
    examid: json["examid"] == null ? null : json["examid"],
    exam: json["exam"] == null ? null : json["exam"],
    from: json["from"] == null ? null : json["from"],
    to: json["to"] == null ? null : json["to"],
    duration: json["duration"] == null ? null : json["duration"],
    totalAttempt: json["totalAttempt"] == null ? null : json["totalAttempt"],
    description: json["description"] == null ? null : json["description"],
    attempted: json["attempted"] == null ? null : json["attempted"],
    status: json["status"] == null ? null : json["status"],
    passing: json["passing"] == null ? null : json["passing"],
  );

  Map<String, dynamic> toJson() => {
    "optA": optA == null ? null : optA,
    "optB": optB == null ? null : optB,
    "optC": optC == null ? null : optC,
    "optD": optD == null ? null : optD,
    "optE": optE == null ? null : optE,
    "question": question == null ? null : question,
    "qusid": qusid == null ? null : qusid,
    "answer": answer == null ? null : answerValues.reverse[answer],
    "examid": examid == null ? null : examid,
    "exam": exam == null ? null : exam,
    "from": from == null ? null : from,
    "to": to == null ? null : to,
    "duration": duration == null ? null : duration,
    "totalAttempt": totalAttempt == null ? null : totalAttempt,
    "description": description == null ? null : description,
    "attempted": attempted == null ? null : attempted,
    "status": status == null ? null : status,
    "passing": passing == null ? null : passing,
  };
}

enum Answer { OPT_B, OPT_D, OPT_A, OPT_C }

final answerValues = EnumValues({
  "opt_a": Answer.OPT_A,
  "opt_b": Answer.OPT_B,
  "opt_c": Answer.OPT_C,
  "opt_d": Answer.OPT_D
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
