import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/fees.dart';
import 'package:smart_school/providers/fees_provider.dart';
import 'package:smart_school/templates/fees.dart';
import 'package:smart_school/templates/grand_total_card.dart';
import 'package:smart_school/templates/previous_fees_card.dart';

class FeesTab extends StatefulWidget {
  final List<List<FeesData>> feedata;

  const FeesTab({this.feedata});
  @override
  _FeesTabState createState() => _FeesTabState();
}

class _FeesTabState extends State<FeesTab> {
  @override
  void initState() {
    Provider.of<FeesProvider>(context, listen: false)
        .grandTotalData(widget.feedata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       body: 1 == widget.feedata.length ?
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
           return SingleChildScrollView(
             child: Column(
               children: [
                 ExpansionTile(
                   title: Text(
                       'Grand Total',
                       style: TextStyle(fontWeight: FontWeight.bold)
                   ),
                   children: [
                     GrandTotalCard(grandtotal: Provider.of<FeesProvider>(context).grandTotal),
                   ],
                 ),
                 ExpansionTile(
                   title: Text(
                       'Balance Master-Previous Session Balance',
                       style: TextStyle(fontWeight: FontWeight.bold)
                   ),
                   children: [
                     PrevBalCard(prevbal: widget.feedata[widget.feedata.length-1]),
                   ],
                 ),
                 Container(
                   height: 355.0,
                   child: ListView.builder(
                       itemCount: widget.feedata.length-1,
                       itemBuilder: (BuildContext context, int index) {
                         return ExpansionTile(
                           title: Text(
                               '${widget.feedata[index][widget.feedata[index].length-1].type}',
                               style: TextStyle(fontWeight: FontWeight.bold)
                           ),
                           children: [
                             FeesCard(feedata: widget.feedata[index]),
                           ],
                         );
                       }
                   )
                 )
               ]
             ),
           );
         },
       )
    );
  }
}
