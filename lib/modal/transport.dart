import 'dart:convert';

List<TransportData> transportDataFromJson(String str) => List<TransportData>.from(json.decode(str).map((x) => TransportData.fromJson(x)));

String transportDataToJson(List<TransportData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransportData {
  TransportData({
    this.vehicleNo,
    this.id,
    this.routeTitle,
    this.vehicleAssigned,
    this.success,
  });

  String vehicleNo;
  String id;
  String routeTitle;
  String vehicleAssigned;
  String success;

  factory TransportData.fromJson(Map<String, dynamic> json) => TransportData(
    vehicleNo: json["vehicle_no"] == null ? null : json["vehicle_no"],
    id: json["id"] == null ? null : json["id"],
    routeTitle: json["route_title"] == null ? null : json["route_title"],
    vehicleAssigned: json["vehicleAssigned"] == null ? null : json["vehicleAssigned"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "vehicle_no": vehicleNo == null ? null : vehicleNo,
    "id": id == null ? null : id,
    "route_title": routeTitle == null ? null : routeTitle,
    "vehicleAssigned": vehicleAssigned == null ? null : vehicleAssigned,
    "success": success == null ? null : success,
  };
}
