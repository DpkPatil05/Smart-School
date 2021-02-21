import 'dart:convert';

List<List<DownloadCenterData>> downloadCenterDataFromJson(String str) => List<List<DownloadCenterData>>.from(json.decode(str).map((x) => List<DownloadCenterData>.from(x.map((x) => DownloadCenterData.fromJson(x)))));

String downloadCenterDataToJson(List<List<DownloadCenterData>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class DownloadCenterData {
  DownloadCenterData({
    this.title,
    this.type,
    this.date,
    this.link,
  });

  String title;
  String type;
  String date;
  String link;

  factory DownloadCenterData.fromJson(Map<String, dynamic> json) => DownloadCenterData(
    title: json["title"],
    type: json["type"],
    date: json["date"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "type": type,
    "date": date,
    "link": link,
  };
}
