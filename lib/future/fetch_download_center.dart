import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/download_center.dart';
import 'package:smart_school/providers/download_center_provider.dart';
import 'package:smart_school/tabs/hamItems/download_center.dart';

class FetchDownloadCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<List<DownloadCenterData>>>.value(
      value: null,
      child: FutureBuilder<List<List<DownloadCenterData>>>(
        future: DownloadCenterProvider().fetchDownloadContent(),
        builder: (BuildContext context, AsyncSnapshot<List<List<DownloadCenterData>>> downloadCenterData) {
          switch (downloadCenterData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return downloadCenterData.hasError? Text('Error: ${downloadCenterData.error}')
                  : DownloadCenter(downloadcenterdata: downloadCenterData.data);
          }
        },
      ),
    );
  }
}