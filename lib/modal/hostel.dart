import 'dart:convert';

List<HostelData> hostelDataFromJson(String str) => List<HostelData>.from(json.decode(str).map((x) => HostelData.fromJson(x)));

String hostelDataToJson(List<HostelData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HostelData {
  HostelData({
    this.id,
    this.name,
    this.success,
  });

  String id;
  String name;
  String success;

  factory HostelData.fromJson(Map<String, dynamic> json) => HostelData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "success": success == null ? null : success,
  };
}
