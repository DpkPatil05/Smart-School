import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/my_documents.dart';
import 'package:smart_school/providers/my_documents_provider.dart';
import 'package:smart_school/tabs/hamItems/my_documents.dart';

class FetchMyDocuments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MyDocumentsData>>.value(
      value: null,
      child: FutureBuilder<List<MyDocumentsData>>(
        future: MyDocumentsProvider().fetchDocuments(),
        builder: (BuildContext context, AsyncSnapshot<List<MyDocumentsData>> documentsData) {
          switch (documentsData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return documentsData.hasError? Text('Error: ${documentsData.error}')
                  : MyDocuments(documentsdata: documentsData.data);
          }
        },
      ),
    );
  }
}