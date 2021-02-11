import 'dart:convert';

List<AttendanceData> attendanceDataFromJson(String str) => List<AttendanceData>.from(json.decode(str).map((x) => AttendanceData.fromJson(x)));

String attendanceDataToJson(List<AttendanceData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceData {
  AttendanceData({
    this.attendancePerct,
    this.success,
  });

  String attendancePerct;
  String success;

  factory AttendanceData.fromJson(Map<String, dynamic> json) => AttendanceData(
    attendancePerct: json["attendancePerct"] == null ? null : json["attendancePerct"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "attendancePerct": attendancePerct == null ? null : attendancePerct,
    "success": success == null ? null : success,
  };
}
