import 'package:flutter/material.dart';
import 'package:smart_school/modal/fees.dart';
import 'package:smart_school/templates/fees.dart';

class FeesTab extends StatefulWidget {
  final List<List<FeesData>> feedata;

  const FeesTab({this.feedata});
  @override
  _FeesTabState createState() => _FeesTabState();
}

class _FeesTabState extends State<FeesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: 0 == widget.feedata.length ?
       Card(
         child: Center(
             child: Text(
               "No data available",
               style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 15.0
               )
             )
         )
       ) : ListView.builder(
         itemCount: widget.feedata.length,
         itemBuilder: (BuildContext context, int index) {
           return FeesCard(feedata: widget.feedata[index]);
         }
       )
    );
  }
}
