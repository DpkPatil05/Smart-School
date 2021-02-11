import 'dart:convert';

LeaveUploadMessage leaveUploadMessageFromJson(String str) => LeaveUploadMessage.fromJson(json.decode(str));

String leaveUploadMessageToJson(LeaveUploadMessage data) => json.encode(data.toJson());

class LeaveUploadMessage {
  LeaveUploadMessage({
    this.success,
  });

  String success;

  factory LeaveUploadMessage.fromJson(Map<String, dynamic> json) => LeaveUploadMessage(
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
  };
}