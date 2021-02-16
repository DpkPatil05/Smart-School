import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_school/hive_operations.dart';
import 'package:smart_school/modal/transport.dart';
import 'package:smart_school/modal/transport_details.dart';
import 'package:smart_school/providers/transport_provider.dart';

class TransportRoutesCard extends StatefulWidget {
  final TransportData transportdata;

  const TransportRoutesCard({this.transportdata});
  @override
  _TransportRoutesCardState createState() => _TransportRoutesCardState();
}

class _TransportRoutesCardState extends State<TransportRoutesCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TransportDetailsData>(
      future: TransportProvider().fetchTransportDetails(int.parse(widget.transportdata.id)),
      builder: (BuildContext context, AsyncSnapshot<TransportDetailsData> transportDetails) {
        switch (transportDetails.connectionState) {
          case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
          default:
            return transportDetails.hasError? Text('Error: ${transportDetails.error}')
            : Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(
                        width: 235.0,
                        child: Text(
                          '${widget.transportdata.routeTitle}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container (
                        child: HiveOperation().vehicleNo == transportDetails.data.vehicleData.vehicleNo ?
                        IconButton(
                          iconSize: 25.0,
                          icon: Icon(Icons.preview_outlined),
                          tooltip: "View Details",
                          onPressed: () => showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) => Container(
                                  alignment: Alignment.center,
                                  height: 300.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${widget.transportdata.routeTitle}',
                                        style: TextStyle(fontSize: 23.0),
                                      ),
                                      SizedBox(height: 20.0),
                                      Card(
                                        child: Table(
                                          children: [
                                            TableRow(children: [
                                              Text(
                                                'Vehicle No:',
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                '${transportDetails.data.vehicleData.vehicleNo}',
                                                style: TextStyle(fontSize: 17.0),
                                              ),
                                            ])
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Table(
                                          children: [
                                            TableRow(children: [
                                              Text(
                                                'Vehicle Model',
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                '${transportDetails.data.vehicleData.vehicleModel}',
                                                style: TextStyle(fontSize: 17.0),
                                              ),
                                            ])
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Table(
                                          children: [
                                            TableRow(children: [
                                              Text(
                                                'Made',
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                '${transportDetails.data.vehicleData.made}',
                                                style: TextStyle(fontSize: 17.0),
                                              ),
                                            ])
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Table(
                                          children: [
                                            TableRow(children: [
                                              Text(
                                                'Driver Name',
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                '${transportDetails.data.vehicleData.driverName}',
                                                style: TextStyle(fontSize: 17.0),
                                              ),
                                            ])
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Table(
                                          children: [
                                            TableRow(children: [
                                              Text(
                                                'Driver License',
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                '${transportDetails.data.vehicleData.driverLicence}',
                                                style: TextStyle(fontSize: 17.0),
                                              ),
                                            ])
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Table(
                                          children: [
                                            TableRow(children: [
                                              Text(
                                                'Driver Contact',
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                '${transportDetails.data.vehicleData.driverNo}',
                                                style: TextStyle(fontSize: 17.0),
                                              ),
                                            ])
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                              )
                          ),
                        ) : SizedBox(width: 47.0, height: 47.0),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.directions_bus_outlined),
                      SizedBox(
                          width: 230.0,
                          child: Text('${transportDetails.data.vehicleData.vehicleModel}')
                      ),
                      SizedBox(width: 50.0)
                    ],
                  ),
                )
            );
        }
      },
    );
  }
}