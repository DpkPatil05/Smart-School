import 'package:flutter/material.dart';
import 'package:smart_school/modal/fees.dart';
import 'package:smart_school/templates/fees.dart';

class FeesTab extends StatefulWidget {
  final List<FeeData> feedata;

  const FeesTab({this.feedata});
  @override
  _FeesTabState createState() => _FeesTabState();
}

class _FeesTabState extends State<FeesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView.builder(
         itemCount: widget.feedata.length-1??0,
         itemBuilder: (BuildContext context, int index) {
           return FeesCard(feedata: widget.feedata[index]);
         },
       ),
    );
  }
}
