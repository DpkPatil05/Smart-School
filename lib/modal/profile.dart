import 'dart:convert';

ProfileData profileDataFromJson(String str) => ProfileData.fromJson(json.decode(str));

String profileDataToJson(ProfileData data) => json.encode(data.toJson());

class ProfileData {
  ProfileData({
    this.success,
    this.studentid,
    this.firstlast,
    this.imgurl,
    this.classsection,
    this.admissionno,
    this.rollno,
    this.rte,
    this.admissiondate,
    this.dob,
    this.category,
    this.mobile,
    this.caste,
    this.religion,
    this.email,
    this.caddress,
    this.paddress,
    this.fathername,
    this.fatherphone,
    this.fatheroccupation,
    this.mothername,
    this.motherphone,
    this.motheroccupation,
    this.fatherpic,
    this.motherpic,
    this.guardianname,
    this.guardianemail,
    this.guardianrelation,
    this.guardianphone,
    this.guardianoccupation,
    this.guardianaddress,
    this.guardianpic,
    this.bloodgroup,
    this.height,
    this.weight,
    this.measurementdate,
    this.previousschool,
    this.accountno,
    this.bankname,
    this.ifsc,
    this.routename,
    this.nationalid,
    this.localid,
  });

  String success;
  String studentid;
  String firstlast;
  String imgurl;
  String classsection;
  String admissionno;
  String rollno;
  String rte;
  String admissiondate;
  String dob;
  String category;
  String mobile;
  String caste;
  String religion;
  String email;
  String caddress;
  String paddress;
  String fathername;
  String fatherphone;
  String fatheroccupation;
  String mothername;
  String motherphone;
  String motheroccupation;
  String fatherpic;
  String motherpic;
  String guardianname;
  String guardianemail;
  String guardianrelation;
  String guardianphone;
  String guardianoccupation;
  String guardianaddress;
  String guardianpic;
  String bloodgroup;
  String height;
  String weight;
  String measurementdate;
  String previousschool;
  String accountno;
  String bankname;
  String ifsc;
  String routename;
  String nationalid;
  String localid;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    success: json["success"],
    studentid: json["studentid"],
    firstlast: json["firstlast"],
    imgurl: json["imgurl"],
    classsection: json["classsection"],
    admissionno: json["admissionno"],
    rollno: json["rollno"],
    rte: json["rte"],
    admissiondate: json["admissiondate"],
    dob: json["dob"],
    category: json["category"],
    mobile: json["mobile"],
    caste: json["caste"],
    religion: json["religion"],
    email: json["email"],
    caddress: json["caddress"],
    paddress: json["paddress"],
    fathername: json["fathername"],
    fatherphone: json["fatherphone"],
    fatheroccupation: json["fatheroccupation"],
    mothername: json["mothername"],
    motherphone: json["motherphone"],
    motheroccupation: json["motheroccupation"],
    fatherpic: json["fatherpic"],
    motherpic: json["motherpic"],
    guardianname: json["guardianname"],
    guardianemail: json["guardianemail"],
    guardianrelation: json["guardianrelation"],
    guardianphone: json["guardianphone"],
    guardianoccupation: json["guardianoccupation"],
    guardianaddress: json["guardianaddress"],
    guardianpic: json["guardianpic"],
    bloodgroup: json["bloodgroup"],
    height: json["height"],
    weight: json["weight"],
    measurementdate: json["measurementdate"],
    previousschool: json["previousschool"],
    accountno: json["accountno"],
    bankname: json["bankname"],
    ifsc: json["ifsc"],
    routename: json["routename"],
    nationalid: json["nationalid"],
    localid: json["localid"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "studentid": studentid,
    "firstlast": firstlast,
    "imgurl": imgurl,
    "classsection": classsection,
    "admissionno": admissionno,
    "rollno": rollno,
    "rte": rte,
    "admissiondate": admissiondate,
    "dob": dob,
    "category": category,
    "mobile": mobile,
    "caste": caste,
    "religion": religion,
    "email": email,
    "caddress": caddress,
    "paddress": paddress,
    "fathername": fathername,
    "fatherphone": fatherphone,
    "fatheroccupation": fatheroccupation,
    "mothername": mothername,
    "motherphone": motherphone,
    "motheroccupation": motheroccupation,
    "fatherpic": fatherpic,
    "motherpic": motherpic,
    "guardianname": guardianname,
    "guardianemail": guardianemail,
    "guardianrelation": guardianrelation,
    "guardianphone": guardianphone,
    "guardianoccupation": guardianoccupation,
    "guardianaddress": guardianaddress,
    "guardianpic": guardianpic,
    "bloodgroup": bloodgroup,
    "height": height,
    "weight": weight,
    "measurementdate": measurementdate,
    "previousschool": previousschool,
    "accountno": accountno,
    "bankname": bankname,
    "ifsc": ifsc,
    "routename": routename,
    "nationalid": nationalid,
    "localid": localid,
  };
}