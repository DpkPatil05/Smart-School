import 'package:flutter/material.dart';
import 'package:smart_school/modal/library.dart';
import 'package:smart_school/templates/library_books.dart';
import 'package:smart_school/templates/library_books_issued.dart';

class Library extends StatefulWidget {
  final List<List<LibraryData>> librarydata;

  const Library({this.librarydata});
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library>  with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.red),
              child: TabBar(
                controller: _controller,
                tabs: [
                  Tab(text: 'Books'),
                  Tab(text: 'Books Issued'),
                ],
              ),
            ),
            Container(
              height: 620.0,
              child: TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    Container(
                      child: ListView.builder(
                          itemCount: widget.librarydata[0]?.length??0,
                          itemBuilder: (context, index) {
                            return 1 == widget.librarydata.length ?
                            Center(
                                child: Text(
                                  "No Books available",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0
                                  ),
                                )
                            ) :
                            LibraryBooksCard(librarydata: widget.librarydata[0][index]);
                          }
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                          itemCount:  widget.librarydata[1]?.length??0,
                          itemBuilder: (context, index) {
                            return 1 == widget.librarydata.length ?
                            Center(
                                child: Text(
                                  "No Books Issued",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0
                                  ),
                                )
                            ) :
                            LibraryBooksIssuedCard(librarydata:
                            widget.librarydata[1][index]);
                          }
                      ),
                    ),
                  ]
              ),
            )
          ]
      ),
    );
  }
}

