import 'dart:convert';

List<TransportDetailsData> transportDetailsDataFromJson(String str) => List<TransportDetailsData>.from(json.decode(str).map((x) => TransportDetailsData.fromJson(x)));

String transportDetailsDataToJson(List<TransportDetailsData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransportDetailsData {
  TransportDetailsData({
    this.vehicleNo,
    this.vehicleModel,
    this.made,
    this.driverName,
    this.driverLicence,
    this.driverNo,
    this.success,
  });

  String vehicleNo;
  String vehicleModel;
  String made;
  String driverName;
  String driverLicence;
  String driverNo;
  String success;

  factory TransportDetailsData.fromJson(Map<String, dynamic> json) => TransportDetailsData(
    vehicleNo: json["vehicle_no"] == null ? null : json["vehicle_no"],
    vehicleModel: json["vehicle_model"] == null ? null : json["vehicle_model"],
    made: json["made"] == null ? null : json["made"],
    driverName: json["driver_name"] == null ? null : json["driver_name"],
    driverLicence: json["driver_licence"] == null ? null : json["driver_licence"],
    driverNo: json["driver_no"] == null ? null : json["driver_no"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "vehicle_no": vehicleNo == null ? null : vehicleNo,
    "vehicle_model": vehicleModel == null ? null : vehicleModel,
    "made": made == null ? null : made,
    "driver_name": driverName == null ? null : driverName,
    "driver_licence": driverLicence == null ? null : driverLicence,
    "driver_no": driverNo == null ? null : driverNo,
    "success": success == null ? null : success,
  };
}