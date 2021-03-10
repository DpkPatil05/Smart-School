import 'dart:convert';

OnlineExamSubmitResponse onineExamSubmitResponseFromJson(String str) =>
    OnlineExamSubmitResponse.fromJson(json.decode(str));

String onineExamSubmitToJson(OnlineExamSubmitResponse data) => json.encode(data.toJson());

class OnlineExamSubmitResponse {
  OnlineExamSubmitResponse({
    this.success,
  });

  String success;

  factory OnlineExamSubmitResponse.fromJson(Map<String, dynamic> json) => OnlineExamSubmitResponse(
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
  };
}
