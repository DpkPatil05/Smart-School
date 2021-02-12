import 'dart:convert';

AttendanceData attendanceDataFromJson(String str) => AttendanceData.fromJson(json.decode(str));

String attendanceDataToJson(AttendanceData data) => json.encode(data.toJson());

class AttendanceData {
  AttendanceData({
    this.attendence,
    this.success,
  });

  Attendence attendence;
  String success;

  factory AttendanceData.fromJson(Map<String, dynamic> json) => AttendanceData(
    attendence: Attendence.fromJson(json["attendence"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "attendence": attendence.toJson(),
    "success": success,
  };
}

class Attendence {
  Attendence({
    this.attendancePerct,
    this.attendancearray,
  });

  String attendancePerct;
  List<dynamic> attendancearray;

  factory Attendence.fromJson(Map<String, dynamic> json) => Attendence(
    attendancePerct: json["attendance_Perct"],
    attendancearray: List<dynamic>.from(json["attendancearray"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "attendance_Perct": attendancePerct,
    "attendancearray": List<dynamic>.from(attendancearray.map((x) => x)),
  };
}
