import 'package:flutter/material.dart';
import 'package:smart_school/modal/library.dart';

class LibraryCard extends StatefulWidget {
  final LibraryData librarydata;

  const LibraryCard({Key key, this.librarydata}) : super(key: key);


  @override
  _LibraryCardState createState() => _LibraryCardState();
}

class _LibraryCardState extends State<LibraryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
          title: Column(
            children: [
              ListTile(
                title: Text('Book Title: ${widget.librarydata.bookTitle}'),
                subtitle: Row(
                  children: [
                    Text('Author: '),
                    Expanded(child: Text('${widget.librarydata.author}')),
                  ],
                ),
              ),
              ListTile(
                title: Text('Book No: ${widget.librarydata.bookNo}'),
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Issue Date: ${widget.librarydata.issueDate}'),
                    Text('Due Date: ${widget.librarydata.dueReturnDate}')
                  ],
                ),
              ),
              ListTile(
                title: Text('Return Date'),
                subtitle: null == widget.librarydata.returnDate ? Text("Not Returned") : Text('${widget.librarydata.returnDate}'),
              ),
            ]
          ),
      ),
    );
  }
}