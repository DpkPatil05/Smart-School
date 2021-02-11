import 'dart:convert';

List<LeaveData> leaveDataFromJson(String str) => List<LeaveData>.from(json.decode(str).map((x) => LeaveData.fromJson(x)));

String leaveDataToJson(List<LeaveData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveData {
  LeaveData({
    this.id,
    this.status,
    this.fromdate,
    this.todate,
    this.applydate,
    this.success,
  });

  String id;
  String status;
  String fromdate;
  String todate;
  String applydate;
  String success;

  factory LeaveData.fromJson(Map<String, dynamic> json) => LeaveData(
    id: json["id"] == null ? null : json["id"],
    status: json["status"] == null ? null : json["status"],
    fromdate: json["fromdate"] == null ? null : json["fromdate"],
    todate: json["todate"] == null ? null : json["todate"],
    applydate: json["applydate"] == null ? null : json["applydate"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "status": status == null ? null : status,
    "fromdate": fromdate == null ? null : fromdate,
    "todate": todate == null ? null : todate,
    "applydate": applydate == null ? null : applydate,
    "success": success == null ? null : success,
  };
}
