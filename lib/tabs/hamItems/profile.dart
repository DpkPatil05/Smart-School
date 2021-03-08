import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_school/modal/profile.dart';
import 'package:smart_school/modal/transport.dart';
import 'package:smart_school/modal/transport_details.dart';
import 'package:smart_school/providers/transport_provider.dart';
import 'package:smart_school/templates/profile.dart';

class Profile extends StatefulWidget {
  final ProfileData studentData;
  final List<TransportData> transportData;
  const Profile({this.studentData, this.transportData});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return null != TransportProvider().getVehicleData(widget.transportData) ?
    FutureBuilder<TransportDetailsData>(
      future:  TransportProvider()
          .fetchTransportDetails(TransportProvider().getVehicleData(widget.transportData)),
        builder: (BuildContext context, AsyncSnapshot<TransportDetailsData> transportDetailData) {
        switch (transportDetailData.connectionState) {
          case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
          default: return transportDetailData.hasError ?
            Text('Error: ${transportDetailData.error}')
            : ProfileView(studentData: widget.studentData, transportdata: transportDetailData.data);
        }
      },
    ) : ProfileView(studentData: widget.studentData, transportdata: null);
  }
}
