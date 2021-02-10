import 'dart:convert';

List<FeeData> feeDataFromJson(String str) => List<FeeData>.from(json.decode(str).map((x) => FeeData.fromJson(x)));

String feeDataToJson(List<FeeData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeeData {
  FeeData({
    this.type,
    this.code,
    this.duedate,
    this.amount,
    this.payment,
    this.success,
  });

  String type;
  String code;
  String duedate;
  String amount;
  Payment payment;
  String success;

  factory FeeData.fromJson(Map<String, dynamic> json) => FeeData(
    type: json["type"] == null ? null : json["type"],
    code: json["code"] == null ? null : json["code"],
    duedate: json["duedate"] == null ? null : json["duedate"],
    amount: json["amount"] == null ? null : json["amount"],
    payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "code": code == null ? null : code,
    "duedate": duedate == null ? null : duedate,
    "amount": amount == null ? null : amount,
    "payment": payment == null ? null : payment.toJson(),
    "success": success == null ? null : success,
  };
}

class Payment {
  Payment({
    this.paidamt,
    this.paymode,
    this.discnt,
    this.fine,
    this.paiddt,
    this.payid,
    this.balanceamt,
  });

  String paidamt;
  String paymode;
  String discnt;
  int fine;
  String paiddt;
  String payid;
  String balanceamt;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    paidamt: json["paidamt"],
    paymode: json["paymode"],
    discnt: json["discnt"],
    fine: json["fine"],
    paiddt: json["paiddt"],
    payid: json["payid"],
    balanceamt: json["balanceamt"],
  );

  Map<String, dynamic> toJson() => {
    "paidamt": paidamt,
    "paymode": paymode,
    "discnt": discnt,
    "fine": fine,
    "paiddt": paiddt,
    "payid": payid,
    "balanceamt": balanceamt,
  };
}