import 'package:flutter/material.dart';

class GrandTotalCard extends StatefulWidget {
  final Map<String, double> grandtotal;

  const GrandTotalCard({this.grandtotal});
  @override
  _GrandTotalCardState createState() => _GrandTotalCardState();
}

class _GrandTotalCardState extends State<GrandTotalCard> {
  Widget _details(String title, double data) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Text(
            '$title:',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(width: 10.0),
          Text('₹$data'),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
            children: <Widget>[
              SizedBox( height: 10.0),
              Expanded(
                child: Center(
                  child: Text(
                    "Grand Total",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _details('Amount', widget.grandtotal['amount']),
                          _details('Discount', widget.grandtotal['discount'])
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          _details('Fine', widget.grandtotal['fine']),
                          _details('Paid', widget.grandtotal['paid'])
                        ],
                      ),
                      Row(
                        children: [
                          _details('Balance', widget.grandtotal['balance'])
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}