import 'package:flutter/material.dart';
import 'package:smart_school/modal/my_documents.dart';
import 'package:smart_school/providers/my_documents_provider.dart';

class MyDocuments extends StatefulWidget {
  final List<MyDocumentsData> documentsdata;

  const MyDocuments({this.documentsdata});
  @override
  _MyDocumentState createState() => _MyDocumentState();
}

class _MyDocumentState extends State<MyDocuments> {
  void _onDownloading(MyDocumentsProvider prov) {
    prov.downloading ?
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              Text("Downloaded ${prov.progress}"),
            ],
          ),
        );
      },
    ) : Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.documentsdata.length-1??0,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "${widget.documentsdata[index].title}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.download_rounded),
                    onPressed: () {
                      MyDocumentsProvider().startDownload(widget.documentsdata[index].doc);
                    }
                ),
              ],
            ),
          );
        }
    );
  }
}
