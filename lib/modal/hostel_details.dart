import 'dart:convert';

List<HostelDetailsData> hostelDetailsDataFromJson(String str) => List<HostelDetailsData>.from(json.decode(str).map((x) => HostelDetailsData.fromJson(x)));

String hostelDetailsDataToJson(List<HostelDetailsData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HostelDetailsData {
  HostelDetailsData({
    this.name,
    this.roomType,
    this.bedcount,
    this.roomNo,
    this.roomcost,
    this.success,
  });

  String name;
  String roomType;
  String bedcount;
  String roomNo;
  String roomcost;
  String success;

  factory HostelDetailsData.fromJson(Map<String, dynamic> json) => HostelDetailsData(
    name: json["name"] == null ? null : json["name"],
    roomType: json["RoomType"] == null ? null : json["RoomType"],
    bedcount: json["bedcount"] == null ? null : json["bedcount"],
    roomNo: json["RoomNo"] == null ? null : json["RoomNo"],
    roomcost: json["Roomcost"] == null ? null : json["Roomcost"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "RoomType": roomType == null ? null : roomType,
    "bedcount": bedcount == null ? null : bedcount,
    "RoomNo": roomNo == null ? null : roomNo,
    "Roomcost": roomcost == null ? null : roomcost,
    "success": success == null ? null : success,
  };
}
