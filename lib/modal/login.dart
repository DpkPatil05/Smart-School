import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  LoginData({
    this.success,
    this.userrole,
    this.studentid,
    this.firstlast,
    this.imgurl,
    this.classsection,
    this.loginDataClass,
    this.schoolname,
    this.sitename,
  });

  String success;
  String userrole;
  String studentid;
  String firstlast;
  String imgurl;
  String classsection;
  String loginDataClass;
  String schoolname;
  String sitename;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    success: json["success"],
    userrole: json["userrole"],
    studentid: json["studentid"],
    firstlast: json["firstlast"],
    imgurl: json["imgurl"],
    classsection: json["classsection"],
    loginDataClass: json["class"],
    schoolname: json["schoolname"],
    sitename: json["sitename"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "userrole": userrole,
    "studentid": studentid,
    "firstlast": firstlast,
    "imgurl": imgurl,
    "classsection": classsection,
    "class": loginDataClass,
    "schoolname": schoolname,
    "sitename": sitename,
  };
}
