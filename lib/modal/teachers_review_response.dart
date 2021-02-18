import 'dart:convert';

PostReviewResponse postReviewResponseFromJson(String str) => PostReviewResponse.fromJson(json.decode(str));

String postReviewResponseToJson(PostReviewResponse data) => json.encode(data.toJson());

class PostReviewResponse {
  PostReviewResponse({
    this.success,
  });

  String success;

  factory PostReviewResponse.fromJson(Map<String, dynamic> json) => PostReviewResponse(
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
  };
}
