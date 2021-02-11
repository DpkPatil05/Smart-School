import 'package:flutter/material.dart';
import 'package:smart_school/modal/hostel.dart';

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
      child: Text("Apply Leave"),
    );
  }
}
