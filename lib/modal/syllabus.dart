
import 'dart:convert';

List<List<List<SyllabusData>>> syllabusDataFromJson(String str) => List<List<List<SyllabusData>>>.from(json.decode(str).map((x) => List<List<SyllabusData>>.from(x.map((x) => List<SyllabusData>.from(x.map((x) => SyllabusData.fromJson(x)))))));

String syllabusDataToJson(List<List<List<SyllabusData>>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))))));

class SyllabusData {
  SyllabusData({
    this.subject,
    this.lesson,
    this.topic,
    this.completion,
    this.date,
  });

  Subject subject;
  Lesson lesson;
  Topic topic;
  Completion completion;
  String date;

  factory SyllabusData.fromJson(Map<String, dynamic> json) => SyllabusData(
    subject: subjectValues.map[json["subject"]],
    lesson: lessonValues.map[json["lesson"]],
    topic: topicValues.map[json["topic"]],
    completion: completionValues.map[json["completion"]],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subjectValues.reverse[subject],
    "lesson": lessonValues.reverse[lesson],
    "topic": topicValues.reverse[topic],
    "completion": completionValues.reverse[completion],
    "date": date,
  };
}

enum Completion { COMPLETE, INCOMPLETE }

final completionValues = EnumValues({
  "Complete": Completion.COMPLETE,
  "Incomplete": Completion.INCOMPLETE
});

enum Lesson { LESSON_1, LESSON_2, LESSON_3, LESSON_4, LESSON_5 }

final lessonValues = EnumValues({
  "Lesson 1": Lesson.LESSON_1,
  "Lesson 2": Lesson.LESSON_2,
  "Lesson 3": Lesson.LESSON_3,
  "Lesson 4": Lesson.LESSON_4,
  "Lesson 5": Lesson.LESSON_5
});

enum Subject { PHYSICS, CHEMISTRY, MATHS, ENGLISH, HINDI }

final subjectValues = EnumValues({
  "Chemistry": Subject.CHEMISTRY,
  "English": Subject.ENGLISH,
  "Hindi": Subject.HINDI,
  "Maths": Subject.MATHS,
  "Physics": Subject.PHYSICS
});

enum Topic { TOPIC_1, TOPIC_2, EMPTY }

final topicValues = EnumValues({
  "": Topic.EMPTY,
  "Topic 1": Topic.TOPIC_1,
  "Topic 2": Topic.TOPIC_2
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
