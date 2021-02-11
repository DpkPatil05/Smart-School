import 'dart:convert';

TransportDetailsData transportDetailsDataFromJson(String str) => TransportDetailsData.fromJson(json.decode(str));

String transportDetailsDataToJson(TransportDetailsData data) => json.encode(data.toJson());

class TransportDetailsData {
  TransportDetailsData({
    this.vehicleData,
    this.success,
  });

  VehicleData vehicleData;
  String success;

  factory TransportDetailsData.fromJson(Map<String, dynamic> json) => TransportDetailsData(
    vehicleData: VehicleData.fromJson(json["vehicleData"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "vehicleData": vehicleData.toJson(),
    "success": success,
  };
}

class VehicleData {
  VehicleData({
    this.vehicleNo,
    this.vehicleModel,
    this.made,
    this.driverName,
    this.driverLicence,
    this.driverNo,
  });

  String vehicleNo;
  String vehicleModel;
  String made;
  String driverName;
  String driverLicence;
  String driverNo;

  factory VehicleData.fromJson(Map<String, dynamic> json) => VehicleData(
    vehicleNo: json["vehicle_no"],
    vehicleModel: json["vehicle_model"],
    made: json["made"],
    driverName: json["driver_name"],
    driverLicence: json["driver_licence"],
    driverNo: json["driver_no"],
  );

  Map<String, dynamic> toJson() => {
    "vehicle_no": vehicleNo,
    "vehicle_model": vehicleModel,
    "made": made,
    "driver_name": driverName,
    "driver_licence": driverLicence,
    "driver_no": driverNo,
  };
}
