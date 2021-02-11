import 'dart:convert';

List<TransportData> transportDataFromJson(String str) => List<TransportData>.from(json.decode(str).map((x) => TransportData.fromJson(x)));

String transportDataToJson(List<TransportData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransportData {
  TransportData({
    this.routeTitle,
    this.vehicleNo,
    this.vehicleAssigned,
    this.id,
    this.success,
  });

  String routeTitle;
  String vehicleNo;
  String vehicleAssigned;
  String id;
  String success;

  factory TransportData.fromJson(Map<String, dynamic> json) => TransportData(
    routeTitle: json["route_title"] == null ? null : json["route_title"],
    vehicleNo: json["vehicle_no"] == null ? null : json["vehicle_no"],
    vehicleAssigned: json["vehicleAssigned"] == null ? null : json["vehicleAssigned"],
    id: json["id"] == null ? null : json["id"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "route_title": routeTitle == null ? null : routeTitle,
    "vehicle_no": vehicleNo == null ? null : vehicleNo,
    "vehicleAssigned": vehicleAssigned == null ? null : vehicleAssigned,
    "id": id == null ? null : id,
    "success": success == null ? null : success,
  };
}
