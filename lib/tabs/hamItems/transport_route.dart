import 'package:flutter/material.dart';
import 'package:smart_school/modal/transport.dart';
import 'package:smart_school/providers/transport_provider.dart';
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
    TransportProvider().getVehicleData(widget.transportdata);
    return Container(
        color: Colors.white,
        child: 1 == widget.transportdata.length ?
        Card(
          child: Center(
              child: Text(
                "No Transport Data available",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0
                ),
              )
          ),
        ) : ListView.builder(
            itemCount: widget.transportdata.length-1??0,
            itemBuilder: (context, index) {
              return TransportRoutesCard(transportdata: widget.transportdata[index]);
            }
        )
    );
  }
}
