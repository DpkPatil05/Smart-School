import 'dart:convert';

List<LessonPlanData> lessonPlanDataFromJson(String str) => List<LessonPlanData>.from(json.decode(str).map((x) => LessonPlanData.fromJson(x)));

String lessonPlanDataToJson(List<LessonPlanData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonPlanData {
  LessonPlanData({
    this.subject,
    this.subCode,
    this.date,
    this.fromTime,
    this.toTime,
    this.lesson,
    this.topic,
    this.subTopic,
    this.generalObjectives,
    this.teachingMethod,
    this.previousKnowledge,
    this.comprehensiveQuestions,
    this.presentation,
  });

  String subject;
  String subCode;
  String date;
  String fromTime;
  String toTime;
  String lesson;
  String topic;
  String subTopic;
  String generalObjectives;
  String teachingMethod;
  String previousKnowledge;
  String comprehensiveQuestions;
  String presentation;

  factory LessonPlanData.fromJson(Map<String, dynamic> json) => LessonPlanData(
    subject: json["subject"],
    subCode: json["subCode"],
    date: json["date"],
    fromTime: json["fromTime"],
    toTime: json["toTime"],
    lesson: json["lesson"],
    topic: json["topic"],
    subTopic: json["subTopic"],
    generalObjectives: json["generalObjectives"],
    teachingMethod: json["teachingMethod"],
    previousKnowledge: json["previousKnowledge"],
    comprehensiveQuestions: json["comprehensiveQuestions"],
    presentation: json["presentation"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject,
    "subCode": subCode,
    "date": date,
    "fromTime": fromTime,
    "toTime": toTime,
    "lesson": lesson,
    "topic": topic,
    "subTopic": subTopic,
    "generalObjectives": generalObjectives,
    "teachingMethod": teachingMethod,
    "previousKnowledge": previousKnowledge,
    "comprehensiveQuestions": comprehensiveQuestions,
    "presentation": presentation,
  };
}
