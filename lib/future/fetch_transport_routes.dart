import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_school/modal/transport.dart';
import 'package:smart_school/providers/transport_provider.dart';
import 'package:smart_school/tabs/hamItems/transport_route.dart';

class FetchTransportRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TransportData>>.value(
      value: null,
      child: FutureBuilder<List<TransportData>>(
        future: TransportProvider().fetchTransport(),
        builder: (BuildContext context, AsyncSnapshot<List<TransportData>> transportData) {
          switch (transportData.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
            default:
              return transportData.hasError? Text('Error: ${transportData.error}')
                  : TransportRoute(transportdata: transportData.data);
          }
        },
      ),
    );
  }
}