import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/library.dart';
import 'package:smart_school/providers/library.dart';
import 'package:smart_school/tabs/hamItems/library.dart';

class FetchLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<LibraryData>>.value(
      value: null,
      child: FutureBuilder<List<LibraryData>>(
        future: LibraryProvider().fetchLibrary(),
        builder: (BuildContext context, AsyncSnapshot<List<LibraryData>> libraryData) {
          switch (libraryData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return libraryData.hasError? Text('Error: ${libraryData.error}')
                  : Library(librarydata: libraryData.data);
          }
        },
      ),
    );
  }
}