import 'dart:convert';

List<MyDocumentsData> myDocumentsDataFromJson(String str) => List<MyDocumentsData>.from(json.decode(str).map((x) => MyDocumentsData.fromJson(x)));

String myDocumentsDataToJson(List<MyDocumentsData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyDocumentsData {
  MyDocumentsData({
    this.title,
    this.doc,
    this.success,
  });

  String title;
  String doc;
  String success;

  factory MyDocumentsData.fromJson(Map<String, dynamic> json) => MyDocumentsData(
    title: json["title"] == null ? null : json["title"],
    doc: json["doc"] == null ? null : json["doc"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "doc": doc == null ? null : doc,
    "success": success == null ? null : success,
  };
}