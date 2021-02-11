import 'package:flutter/material.dart';

class Hostel extends StatefulWidget {
  @override
  _HostelState createState() => _HostelState();
}

class _HostelState extends State<Hostel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        SizedBox(
                          width: 150.0,
                          child: Text(
                            'Boys Hostel',
                            style: TextStyle(
                              fontSize: 20.0,
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
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text('Hostel members'),
                                        );
                                      })
                                )
                            )
                          ),
                        ),
                      ]),
                ),
            );
          }),
    );
  }
}
