import 'dart:convert';

List<TimeTableData> timeTableDataFromJson(String str) => List<TimeTableData>.from(json.decode(str).map((x) => TimeTableData.fromJson(x)));

String timeTableDataToJson(List<TimeTableData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TimeTableData {
  TimeTableData({
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
  String wednesday;
  String thursday;
  Day friday;
  String saturday;
  String sunday;
  String success;

  factory TimeTableData.fromJson(Map<String, dynamic> json) => TimeTableData(
    monday: json["Monday"] == null ? null : Monday.fromJson(json["Monday"]),
    tuesday: json["Tuesday"] == null ? null : Day.fromJson(json["Tuesday"]),
    wednesday: json["Wednesday"] == null ? null : json["Wednesday"],
    thursday: json["Thursday"] == null ? null : json["Thursday"],
    friday: json["Friday"] == null ? null : Day.fromJson(json["Friday"]),
    saturday: json["Saturday"] == null ? null : json["Saturday"],
    sunday: json["Sunday"] == null ? null : json["Sunday"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "Monday": monday == null ? null : monday.toJson(),
    "Tuesday": tuesday == null ? null : tuesday.toJson(),
    "Wednesday": wednesday == null ? null : wednesday,
    "Thursday": thursday == null ? null : thursday,
    "Friday": friday == null ? null : friday.toJson(),
    "Saturday": saturday == null ? null : saturday,
    "Sunday": sunday == null ? null : sunday,
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

  English english;
  English hindi;
  English maths;
  English socialStudies;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    english: English.fromJson(json["English"]),
    hindi: English.fromJson(json["Hindi"]),
    maths: English.fromJson(json["Maths"]),
    socialStudies: json["Social Studies"] == null ? null : English.fromJson(json["Social Studies"]),
  );

  Map<String, dynamic> toJson() => {
    "English": english.toJson(),
    "Hindi": hindi.toJson(),
    "Maths": maths.toJson(),
    "Social Studies": socialStudies == null ? null : socialStudies.toJson(),
  };
}

class English {
  English({
    this.roomno,
    this.timeFrom,
    this.timeTo,
  });

  String roomno;
  String timeFrom;
  String timeTo;

  factory English.fromJson(Map<String, dynamic> json) => English(
    roomno: json["roomno"],
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
  );

  Map<String, dynamic> toJson() => {
    "roomno": roomno,
    "time_from": timeFrom,
    "time_to": timeTo,
  };
}

class Monday {
  Monday({
    this.english,
    this.hindi,
  });

  English english;
  English hindi;

  factory Monday.fromJson(Map<String, dynamic> json) => Monday(
    english: English.fromJson(json["English"]),
    hindi: English.fromJson(json["Hindi"]),
  );

  Map<String, dynamic> toJson() => {
    "English": english.toJson(),
    "Hindi": hindi.toJson(),
  };
}