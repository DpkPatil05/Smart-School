import 'package:flutter/material.dart';
import 'package:smart_school/modal/library.dart';

class LibraryBooksCard extends StatefulWidget {
  final LibraryData librarydata;

  const LibraryBooksCard({this.librarydata});

  @override
  _LibraryBooksCardState createState() => _LibraryBooksCardState();
}

class _LibraryBooksCardState extends State<LibraryBooksCard> {
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Publisher',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ))
                ),
                Text('${widget.librarydata.publisher}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Subject',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ))
                ),
                Text('${widget.librarydata.subject}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Rack No',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ))
                ),
                Text('${widget.librarydata.racknumber}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Qty',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ))
                ),
                Text('${widget.librarydata.qty}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Price',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ))
                ),
                Text('${widget.librarydata.bookprice}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.0,
                  child: Text('Post Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ))
                ),
                Text('${widget.librarydata.postdate}'),
                SizedBox(width: 5.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}