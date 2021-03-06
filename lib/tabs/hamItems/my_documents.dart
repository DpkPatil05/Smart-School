import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/my_documents.dart';
import 'package:smart_school/providers/my_documents_provider.dart';
import 'package:smart_school/services/check_permissions.dart';
import 'package:smart_school/services/download.dart';

class MyDocuments extends StatefulWidget {
  final List<MyDocumentsData> documentsdata;

  const MyDocuments({this.documentsdata});
  @override
  _MyDocumentState createState() => _MyDocumentState();
}

class _MyDocumentState extends State<MyDocuments> {
  bool downloadingContent = false;

  @override
  Widget build(BuildContext context) {
    return downloadingContent ?
        ChangeNotifierProvider(
          create: (context) => Download(),
          child: Consumer<Download>(
            builder: (BuildContext context, data, Widget child) {
              downloadingContent = data.downloading;
              return Center(
                child: Container(
                  height: 120.0,
                  width: 200.0,
                  child: Card(
                    color: Colors.white70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 10.0),
                        Text("Downloading ${data.progress}")
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
        ) : 1 == widget.documentsdata.length ?
            Card(
              child: Center(
                  child: Text(
                    "No Documents available",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0
                    ),
                  )
              ),
            )
          : ListView.builder(
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
                              CheckPermissions().checkStoragePermission().then((value) =>
                                  MyDocumentsProvider().generateDownload(widget.documentsdata[index].doc)
                              );
                            }
                        ),
                      ],
                    ),
                  );
                }
              );
  }
}
