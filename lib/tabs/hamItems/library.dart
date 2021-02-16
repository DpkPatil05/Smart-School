import 'package:flutter/material.dart';
import 'package:smart_school/modal/library.dart';
import 'package:smart_school/templates/library.dart';

class Library extends StatefulWidget {
  final List<LibraryData> librarydata;

  const Library({this.librarydata});
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return 1 == widget.librarydata.length ?
    Card(
      child: Center(
          child: Text(
            "No Books available",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0
            ),
          )
      ),
    ):ListView.builder(
        itemCount: widget.librarydata.length-1??0,
        itemBuilder: (context, index) {
          return LibraryCard(librarydata: widget.librarydata[index]);
        }
    );
  }
}

