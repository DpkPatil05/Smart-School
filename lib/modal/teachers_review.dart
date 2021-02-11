import 'dart:convert';

List<TeacherReviewData> teacherReviewDataFromJson(String str) => List<TeacherReviewData>.from(json.decode(str).map((x) => TeacherReviewData.fromJson(x)));

String teacherReviewDataToJson(List<TeacherReviewData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeacherReviewData {
  TeacherReviewData({
    this.day,
    this.trName,
    this.trid,
    this.phone,
    this.email,
    this.roomNumber,
    this.rating,
    this.fromTime,
    this.toTime,
    this.success,
  });

  String day;
  String trName;
  String trid;
  String phone;
  String email;
  String roomNumber;
  String rating;
  String fromTime;
  String toTime;
  String success;

  factory TeacherReviewData.fromJson(Map<String, dynamic> json) => TeacherReviewData(
    day: json["day"] == null ? null : json["day"],
    trName: json["trName"] == null ? null : json["trName"],
    trid: json["trid"] == null ? null : json["trid"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    roomNumber: json["roomNumber"] == null ? null : json["roomNumber"],
    rating: json["rating"] == null ? null : json["rating"],
    fromTime: json["fromTime"] == null ? null : json["fromTime"],
    toTime: json["toTime"] == null ? null : json["toTime"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "day": day == null ? null : day,
    "trName": trName == null ? null : trName,
    "trid": trid == null ? null : trid,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "roomNumber": roomNumber == null ? null : roomNumber,
    "rating": rating == null ? null : rating,
    "fromTime": fromTime == null ? null : fromTime,
    "toTime": toTime == null ? null : toTime,
    "success": success == null ? null : success,
  };
}
