import 'dart:convert';

List<LessonPlan> lessonPlanFromJson(String str) => List<LessonPlan>.from(json.decode(str).map((x) => LessonPlan.fromJson(x)));

String lessonPlanToJson(List<LessonPlan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonPlan {
  LessonPlan({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.success,
  });

  Monday monday;
  Day tuesday;
  Saturday wednesday;
  Saturday thursday;
  Day friday;
  Saturday saturday;
  Saturday sunday;
  String success;

  factory LessonPlan.fromJson(Map<String, dynamic> json) => LessonPlan(
    monday: json["Monday"] == null ? null : Monday.fromJson(json["Monday"]),
    tuesday: json["Tuesday"] == null ? null : Day.fromJson(json["Tuesday"]),
    wednesday: json["Wednesday"] == null ? null : Saturday.fromJson(json["Wednesday"]),
    thursday: json["Thursday"] == null ? null : Saturday.fromJson(json["Thursday"]),
    friday: json["Friday"] == null ? null : Day.fromJson(json["Friday"]),
    saturday: json["Saturday"] == null ? null : Saturday.fromJson(json["Saturday"]),
    sunday: json["Sunday"] == null ? null : Saturday.fromJson(json["Sunday"]),
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "Monday": monday == null ? null : monday.toJson(),
    "Tuesday": tuesday == null ? null : tuesday.toJson(),
    "Wednesday": wednesday == null ? null : wednesday.toJson(),
    "Thursday": thursday == null ? null : thursday.toJson(),
    "Friday": friday == null ? null : friday.toJson(),
    "Saturday": saturday == null ? null : saturday.toJson(),
    "Sunday": sunday == null ? null : sunday.toJson(),
    "success": success == null ? null : success,
  };
}

class Day {
  Day({
    this.english,
    this.hindi,
    this.maths,
    this.socialStudies,
  });

  Saturday english;
  Saturday hindi;
  Saturday maths;
  Saturday socialStudies;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    english: Saturday.fromJson(json["English"]),
    hindi: Saturday.fromJson(json["Hindi"]),
    maths: Saturday.fromJson(json["Maths"]),
    socialStudies: json["Social Studies"] == null ? null : Saturday.fromJson(json["Social Studies"]),
  );

  Map<String, dynamic> toJson() => {
    "English": english.toJson(),
    "Hindi": hindi.toJson(),
    "Maths": maths.toJson(),
    "Social Studies": socialStudies == null ? null : socialStudies.toJson(),
  };
}

class Saturday {
  Saturday({
    this.roomno,
    this.timeFrom,
    this.timeTo,
    this.subjectname,
  });

  String roomno;
  String timeFrom;
  String timeTo;
  String subjectname;

  factory Saturday.fromJson(Map<String, dynamic> json) => Saturday(
    roomno: json["roomno"],
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
    subjectname: json["subjectname"] == null ? null : json["subjectname"],
  );

  Map<String, dynamic> toJson() => {
    "roomno": roomno,
    "time_from": timeFrom,
    "time_to": timeTo,
    "subjectname": subjectname == null ? null : subjectname,
  };
}

class Monday {
  Monday({
    this.english,
    this.hindi,
  });

  Saturday english;
  Saturday hindi;

  factory Monday.fromJson(Map<String, dynamic> json) => Monday(
    english: Saturday.fromJson(json["English"]),
    hindi: Saturday.fromJson(json["Hindi"]),
  );

  Map<String, dynamic> toJson() => {
    "English": english.toJson(),
    "Hindi": hindi.toJson(),
  };
}