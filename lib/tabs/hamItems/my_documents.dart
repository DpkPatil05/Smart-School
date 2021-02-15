import 'package:flutter/material.dart';

class MyDocuments extends StatefulWidget {
  @override
  _MyDocumentState createState() => _MyDocumentState();
}

class _MyDocumentState extends State<MyDocuments> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Document title from server",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.download_rounded),
                    onPressed: () {}
                ),
              ],
            ),
          );
        }
    );
  }
}
