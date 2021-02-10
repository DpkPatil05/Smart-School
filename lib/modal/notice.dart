import 'dart:convert';

List<NoticeData> noticeDataFromJson(String str) => List<NoticeData>.from(json.decode(str).map((x) => NoticeData.fromJson(x)));

String noticeDataToJson(List<NoticeData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NoticeData {
  NoticeData({
    this.title,
    this.date,
    this.msg,
    this.success,
  });

  String title;
  String date;
  String msg;
  String success;

  factory NoticeData.fromJson(Map<String, dynamic> json) => NoticeData(
    title: json["title"] == null ? null : json["title"],
    date: json["date"] == null ? null : json["date"],
    msg: json["msg"] == null ? null : json["msg"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "date": date == null ? null : date,
    "msg": msg == null ? null : msg,
    "success": success == null ? null : success,
  };
}
