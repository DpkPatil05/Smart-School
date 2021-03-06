import 'dart:convert';

List<List<FeesData>> feesDataFromJson(String str) => List<List<FeesData>>.from(json.decode(str).map((x) => List<FeesData>.from(x.map((x) => FeesData.fromJson(x)))));

String feesDataToJson(List<List<FeesData>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class FeesData {
  FeesData({
    this.paidamt,
    this.paymode,
    this.discnt,
    this.fine,
    this.paiddt,
    this.payid,
    this.balanceamt,
    this.duedate,
    this.amount,
    this.type,
    this.code,
  });

  String paidamt;
  String paymode;
  String discnt;
  String fine;
  String paiddt;
  String payid;
  String balanceamt;
  String duedate;
  String amount;
  String type;
  String code;

  factory FeesData.fromJson(Map<String, dynamic> json) => FeesData(
    paidamt: json["paidamt"] == null ? null : json["paidamt"],
    paymode: json["paymode"] == null ? null : json["paymode"],
    discnt: json["discnt"],
    fine: json["fine"],
    paiddt: json["paiddt"] == null ? null : json["paiddt"],
    payid: json["payid"] == null ? null : json["payid"],
    balanceamt: json["balanceamt"] == null ? null : json["balanceamt"],
    duedate: json["duedate"] == null ? null : json["duedate"],
    amount: json["amount"] == null ? null : json["amount"],
    type: json["type"] == null ? null : json["type"],
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "paidamt": paidamt == null ? null : paidamt,
    "paymode": paymode == null ? null : paymode,
    "discnt": discnt,
    "fine": fine,
    "paiddt": paiddt == null ? null : paiddt,
    "payid": payid == null ? null : payid,
    "balanceamt": balanceamt == null ? null : balanceamt,
    "duedate": duedate == null ? null : duedate,
    "amount": amount == null ? null : amount,
    "type": type == null ? null : type,
    "code": code == null ? null : code,
  };
}
