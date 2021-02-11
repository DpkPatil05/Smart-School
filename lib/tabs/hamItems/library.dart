import 'package:flutter/material.dart';
import 'package:smart_school/modal/library.dart';

class Library extends StatefulWidget {
  final List<LibraryData> librarydata;

  const Library({this.librarydata});
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Library"),
    );
  }
}
