import 'dart:convert';

List<List<LibraryData>> libraryDataFromJson(String str) => List<List<LibraryData>>.from(json.decode(str).map((x) => List<LibraryData>.from(x.map((x) => LibraryData.fromJson(x)))));

String libraryDataToJson(List<List<LibraryData>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class LibraryData {
  LibraryData({
    this.title,
    this.publisher,
    this.author,
    this.subject,
    this.racknumber,
    this.qty,
    this.bookprice,
    this.postdate,
    this.bookno,
    this.issueDate,
    this.dueReturnDate,
    this.returnDate,
  });

  String title;
  String publisher;
  String author;
  String subject;
  String racknumber;
  String qty;
  String bookprice;
  DateTime postdate;
  String bookno;
  String issueDate;
  String dueReturnDate;
  String returnDate;

  factory LibraryData.fromJson(Map<String, dynamic> json) => LibraryData(
    title: json["title"],
    publisher: json["publisher"] == null ? null : json["publisher"],
    author: json["author"],
    subject: json["subject"] == null ? null : json["subject"],
    racknumber: json["racknumber"] == null ? null : json["racknumber"],
    qty: json["qty"] == null ? null : json["qty"],
    bookprice: json["bookprice"] == null ? null : json["bookprice"],
    postdate: json["postdate"] == null ? null : DateTime.parse(json["postdate"]),
    bookno: json["bookno"] == null ? null : json["bookno"],
    issueDate: json["issue_date"] == null ? null : json["issue_date"],
    dueReturnDate: json["due_return_date"] == null ? null : json["due_return_date"],
    returnDate: json["return_date"] == null ? null : json["return_date"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "publisher": publisher == null ? null : publisher,
    "author": author,
    "subject": subject == null ? null : subject,
    "racknumber": racknumber == null ? null : racknumber,
    "qty": qty == null ? null : qty,
    "bookprice": bookprice == null ? null : bookprice,
    "postdate": postdate == null ? null : "${postdate.year.toString().padLeft(4, '0')}-${postdate.month.toString().padLeft(2, '0')}-${postdate.day.toString().padLeft(2, '0')}",
    "bookno": bookno == null ? null : bookno,
    "issue_date": issueDate == null ? null : issueDate,
    "due_return_date": dueReturnDate == null ? null : dueReturnDate,
    "return_date": returnDate == null ? null : returnDate,
  };
}
