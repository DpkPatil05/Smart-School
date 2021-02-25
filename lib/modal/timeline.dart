import 'dart:convert';

List<TimelineData> timelineDataFromJson(String str) => List<TimelineData>.from(json.decode(str).map((x) => TimelineData.fromJson(x)));

String timelineDataToJson(List<TimelineData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TimelineData {
  TimelineData({
    this.title,
    this.description,
    this.timelineDate,
  });

  String title;
  String description;
  String timelineDate;

  factory TimelineData.fromJson(Map<String, dynamic> json) => TimelineData(
    title: json["title"],
    description: json["description"],
    timelineDate: json["timelineDate"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "timelineDate": timelineDate,
  };
}
