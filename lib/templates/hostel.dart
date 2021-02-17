import 'package:flutter/material.dart';
import 'package:smart_school/modal/hostel.dart';
import 'package:smart_school/modal/hostel_details.dart';

class HostelCard extends StatefulWidget {
  final HostelData hosteldata;
  final List<HostelDetailsData> hosteldetaildata;

  const HostelCard({this.hosteldata, this.hosteldetaildata});

  @override
  _HostelCardState createState() => _HostelCardState();
}

class _HostelCardState extends State<HostelCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              SizedBox(
                width: 150.0,
                child: Text(
                  '${widget.hosteldata.name}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 30.0,
                child: IconButton(
                    iconSize: 20.0,
                    icon: Icon(Icons.preview_outlined),
                    tooltip: "View Details",
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => Container(
                            alignment: Alignment.center,
                            height: 300.0,
                            child: ListView.builder(
                                itemCount: widget.hosteldetaildata.length-1??0,
                                itemBuilder: (context, index) {
                                  return ExpansionTile(
                                    title: Row(
                                      children: [
                                        Text(
                                          '${widget.hosteldetaildata[index].roomType}',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 5.0),
                                        widget.hosteldetaildata[index].roomAssigned == "assigned" ?
                                        Text(
                                          '(Assigned)',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ) : SizedBox(width: 10.0)
                                      ],
                                    ),
                                    children: [
                                      ListTile(
                                          title: Text('Room No: ${widget.hosteldetaildata[index].roomNo}')
                                      ),
                                      ListTile(
                                          title: Text('Bed Count: ${widget.hosteldetaildata[index].bedcount}')
                                      ),
                                      ListTile(
                                          title: Text('Room Cost: ${widget.hosteldetaildata[index].roomcost}')
                                      ),
                                    ],
                                  );
                                }
                            )
                        )
                    )
                ),
              ),
            ]),
      ),
    );
  }
}