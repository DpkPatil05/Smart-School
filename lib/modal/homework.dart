import 'dart:convert';

List<HomeworkData> homeworkDataFromJson(String str) => List<HomeworkData>.from(json.decode(str).map((x) => HomeworkData.fromJson(x)));

String homeworkDataToJson(List<HomeworkData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeworkData {
  HomeworkData({
    this.english,
    this.success,
  });

  English english;
  String success;

  factory HomeworkData.fromJson(Map<String, dynamic> json) => HomeworkData(
    english: json["English"] == null ? null : English.fromJson(json["English"]),
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "English": english == null ? null : english.toJson(),
    "success": success == null ? null : success,
  };
}

class English {
  English({
    this.description,
    this.hwdate,
    this.submitdate,
    this.evaldate,
    this.completion,
  });

  String description;
  String hwdate;
  String submitdate;
  String evaldate;
  String completion;

  factory English.fromJson(Map<String, dynamic> json) => English(
    description: json["description"],
    hwdate: json["hwdate"],
    submitdate: json["submitdate"],
    evaldate: json["evaldate"],
    completion: json["completion"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "hwdate": hwdate,
    "submitdate": submitdate,
    "evaldate": evaldate,
    "completion": completion,
  };
}