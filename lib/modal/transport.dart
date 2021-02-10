import 'dart:convert';

TransportData transportDataFromJson(String str) => TransportData.fromJson(json.decode(str));

String transportDataToJson(TransportData data) => json.encode(data.toJson());

class TransportData {
  TransportData({
    this.transport,
    this.success,
  });

  Transport transport;
  String success;

  factory TransportData.fromJson(Map<String, dynamic> json) => TransportData(
    transport: Transport.fromJson(json["transport"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "transport": transport.toJson(),
    "success": success,
  };
}

class Transport {
  Transport({
    this.routeTitle,
    this.vehicleNo,
    this.id,
  });

  String routeTitle;
  String vehicleNo;
  String id;

  factory Transport.fromJson(Map<String, dynamic> json) => Transport(
    routeTitle: json["route_title"],
    vehicleNo: json["vehicle_no"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "route_title": routeTitle,
    "vehicle_no": vehicleNo,
    "id": id,
  };
}