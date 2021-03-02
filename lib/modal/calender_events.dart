import 'dart:convert';

List<EventData> eventDataFromJson(String str) => List<EventData>.from(json.decode(str).map((x) => EventData.fromJson(x)));

String eventDataToJson(List<EventData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventData {
  EventData({
    this.title,
    this.startdate,
    this.enddate,
  });

  String title;
  String startdate;
  String enddate;

  factory EventData.fromJson(Map<String, dynamic> json) => EventData(
    title: json["title"],
    startdate: json["startdate"],
    enddate: json["enddate"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "startdate": startdate,
    "enddate": enddate,
  };
}
