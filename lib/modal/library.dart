import 'dart:convert';

List<LibraryData> libraryDataFromJson(String str) => List<LibraryData>.from(json.decode(str).map((x) => LibraryData.fromJson(x)));

String libraryDataToJson(List<LibraryData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LibraryData {
  LibraryData({
    this.bookTitle,
    this.bookNo,
    this.author,
    this.issueDate,
    this.dueReturnDate,
    this.returnDate,
    this.success,
  });

  String bookTitle;
  String bookNo;
  String author;
  String issueDate;
  String dueReturnDate;
  dynamic returnDate;
  String success;

  factory LibraryData.fromJson(Map<String, dynamic> json) => LibraryData(
    bookTitle: json["BookTitle"] == null ? null : json["BookTitle"],
    bookNo: json["BookNo"] == null ? null : json["BookNo"],
    author: json["Author"] == null ? null : json["Author"],
    issueDate: json["IssueDate"] == null ? null : json["IssueDate"],
    dueReturnDate: json["DueReturnDate"] == null ? null : json["DueReturnDate"],
    returnDate: json["ReturnDate"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "BookTitle": bookTitle == null ? null : bookTitle,
    "BookNo": bookNo == null ? null : bookNo,
    "Author": author == null ? null : author,
    "IssueDate": issueDate == null ? null : issueDate,
    "DueReturnDate": dueReturnDate == null ? null : dueReturnDate,
    "ReturnDate": returnDate,
    "success": success == null ? null : success,
  };
}
