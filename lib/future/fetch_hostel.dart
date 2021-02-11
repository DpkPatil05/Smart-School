import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/hostel.dart';
import 'package:smart_school/providers/hostel_provider.dart';
import 'package:smart_school/tabs/hamItems/hostels.dart';

class FetchHostel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<HostelData>>.value(
      value: null,
      child: FutureBuilder<List<HostelData>>(
        future: HostelProvider().fetchHostel(),
        builder: (BuildContext context, AsyncSnapshot<List<HostelData>> hostelData) {
          switch (hostelData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return hostelData.hasError? Text('Error: ${hostelData.error}')
                  : Hostel(hosteldata: hostelData.data);
          }
        },
      ),
    );
  }
}