import 'dart:convert';

List<LeaveData> leaveDataFromJson(String str) => List<LeaveData>.from(json.decode(str).map((x) => LeaveData.fromJson(x)));

String leaveDataToJson(List<LeaveData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveData {
  LeaveData({
    this.document,
    this.id,
    this.status,
    this.fromdate,
    this.todate,
    this.applydate,
    this.reason,
    this.success,
  });

  String document;
  String id;
  String status;
  String fromdate;
  String todate;
  String applydate;
  String reason;
  String success;

  factory LeaveData.fromJson(Map<String, dynamic> json) => LeaveData(
    document: json["document"] == null ? null : json["document"],
    id: json["id"] == null ? null : json["id"],
    status: json["status"] == null ? null : json["status"],
    fromdate: json["fromdate"] == null ? null : json["fromdate"],
    todate: json["todate"] == null ? null : json["todate"],
    applydate: json["applydate"] == null ? null : json["applydate"],
    reason: json["reason"] == null ? null : json["reason"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "document": document == null ? null : document,
    "id": id == null ? null : id,
    "status": status == null ? null : status,
    "fromdate": fromdate == null ? null : fromdate,
    "todate": todate == null ? null : todate,
    "applydate": applydate == null ? null : applydate,
    "reason": reason == null ? null : reason,
    "success": success == null ? null : success,
  };
}
