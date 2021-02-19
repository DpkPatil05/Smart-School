import 'package:flutter/material.dart';
import 'package:smart_school/modal/library.dart';

class LibraryBooksIssuedCard extends StatefulWidget {
  final LibraryData librarydata;

  const LibraryBooksIssuedCard({this.librarydata});


  @override
  _LibraryBooksIssuedCardState createState() => _LibraryBooksIssuedCardState();
}

class _LibraryBooksIssuedCardState extends State<LibraryBooksIssuedCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ExpansionTile(
        title: Text('${widget.librarydata.title}',
            style: TextStyle(
                fontWeight: FontWeight.bold
            )),
        children: [
          ListTile(
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Author',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Text('${widget.librarydata.author}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
          ListTile(
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Book No',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Text('${widget.librarydata.bookno}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
          ListTile(
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Issue Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Text('${widget.librarydata.issueDate}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
          ListTile(
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Due Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Text('${widget.librarydata.dueReturnDate}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
          ListTile(
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Return Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                null == widget.librarydata.returnDate ?
                Text("Not Returned") :
                Text('${widget.librarydata.returnDate}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}