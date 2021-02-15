import 'package:flutter/material.dart';
import 'package:smart_school/modal/my_documents.dart';

class MyDocuments extends StatefulWidget {
  final List<MyDocumentsData> documentsdata;

  const MyDocuments({this.documentsdata});
  @override
  _MyDocumentState createState() => _MyDocumentState();
}

class _MyDocumentState extends State<MyDocuments> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.documentsdata.length??0,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.documentsdata[index].title}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.download_rounded),
                    onPressed: () {
                    }
                ),
              ],
            ),
          );
        }
    );
  }
}
