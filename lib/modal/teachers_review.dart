import 'dart:convert';

List<TeacherReviewData> teacherReviewDataFromJson(String str) => List<TeacherReviewData>.from(json.decode(str).map((x) => TeacherReviewData.fromJson(x)));

String teacherReviewDataToJson(List<TeacherReviewData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeacherReviewData {
  TeacherReviewData({
    this.staffid,
    this.trName,
    this.employeeid,
    this.phone,
    this.email,
    this.classteacher,
    this.rating,
    this.success,
  });

  String staffid;
  String trName;
  String employeeid;
  String phone;
  String email;
  String classteacher;
  String rating;
  String success;

  factory TeacherReviewData.fromJson(Map<String, dynamic> json) => TeacherReviewData(
    staffid: json["staffid"] == null ? null : json["staffid"],
    trName: json["trName"] == null ? null : json["trName"],
    employeeid: json["employeeid"] == null ? null : json["employeeid"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    classteacher: json["classteacher"] == null ? null : json["classteacher"],
    rating: json["rating"] == null ? null : json["rating"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "staffid": staffid == null ? null : staffid,
    "trName": trName == null ? null : trName,
    "employeeid": employeeid == null ? null : employeeid,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "classteacher": classteacher == null ? null : classteacher,
    "rating": rating == null ? null : rating,
    "success": success == null ? null : success,
  };
}
