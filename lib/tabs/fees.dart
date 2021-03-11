import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/fees.dart';
import 'package:smart_school/providers/fees_provider.dart';
import 'package:smart_school/templates/fees.dart';

class FeesTab extends StatefulWidget {
  final List<List<FeesData>> feedata;

  const FeesTab({this.feedata});
  @override
  _FeesTabState createState() => _FeesTabState();
}

class _FeesTabState extends State<FeesTab> {
  Map<String, int> grandTotal = {};
  @override
  Widget build(BuildContext context) {
    setState(() {
      grandTotal = Provider.of(context, listen: true).grandTotalData(widget.feedata);
    });
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
       ) : Consumer<FeesProvider>(
         builder: (BuildContext context, feesProv, _) {
           return Column(
             children: [
               Card(
                 child: Text(""),
               ),
               Card(
                 child: Text(""),
               ),
               Container(
                 height: 450.0,
                 child: ListView.builder(
                     itemCount: widget.feedata.length??0,
                     itemBuilder: (BuildContext context, int index) {
                       return FeesCard(feedata: widget.feedata[index]);
                     }
                 ),
               ),
             ],
           );
         },
       )
    );
  }
}
