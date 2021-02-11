import 'package:flutter/material.dart';
import 'package:smart_school/modal/transport.dart';
import 'package:smart_school/templates/transport_routes.dart';

class TransportRoute extends StatefulWidget {
  final List<TransportData> transportdata;

  const TransportRoute({this.transportdata});
  @override
  _TransportRouteState createState() => _TransportRouteState();
}

class _TransportRouteState extends State<TransportRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: widget.transportdata.length-1??0,
            itemBuilder: (context, index) {
              return TransportRoutesCard(transportdata: widget.transportdata[index]);
            }
        )
    );
  }
}
