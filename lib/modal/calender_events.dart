import 'dart:convert';

List<EventData> eventDataFromJson(String str) => List<EventData>.from(json.decode(str).map((x) => EventData.fromJson(x)));

String eventDataToJson(List<EventData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventData {
  EventData({
    this.title,
    this.startdate,
    this.enddate,
    this.description,
  });

  String title;
  String startdate;
  String enddate;
  String description;

  factory EventData.fromJson(Map<String, dynamic> json) => EventData(
    title: json["title"],
    startdate: json["startdate"],
    enddate: json["enddate"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "startdate": startdate,
    "enddate": enddate,
    "description": description,
  };
}
