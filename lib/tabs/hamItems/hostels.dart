import 'package:flutter/material.dart';
import 'package:smart_school/modal/hostel.dart';
import 'package:smart_school/modal/hostel_details.dart';
import 'package:smart_school/providers/hostel_provider.dart';
import 'package:smart_school/templates/hostel.dart';

class Hostel extends StatefulWidget {
  final List<HostelData> hosteldata;

  const Hostel({this.hosteldata});
  @override
  _HostelState createState() => _HostelState();
}

class _HostelState extends State<Hostel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: 1 == widget.hosteldata.length ?
      Card(
        child: Center(
            child: Text(
              "No Hostels available",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
              ),
            )
        ),
      ):ListView.builder(
          itemCount: widget.hosteldata.length-1??0,
          itemBuilder: (context, index) {
            return FutureBuilder<List<HostelDetailsData>>(
              future: HostelProvider().fetchHostelDetails(int.parse(widget.hosteldata[index].id)),
              builder: (BuildContext context, AsyncSnapshot<List<HostelDetailsData>> hostelDetailData) {
                switch (hostelDetailData.connectionState) {
                  case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
                  default:
                    return hostelDetailData.hasError? Text('Error: ${hostelDetailData.error}')
                        : HostelCard(hosteldata: widget.hosteldata[index], hosteldetaildata: hostelDetailData.data);
                }
              },
            );
          }),
    );
  }
}
