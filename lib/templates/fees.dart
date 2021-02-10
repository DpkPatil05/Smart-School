import 'package:flutter/material.dart';
import 'package:smart_school/modal/fees.dart';

class FeesCard extends StatefulWidget {
  final FeeData feedata;
  const FeesCard({this.feedata});
  @override
  _FeesCardState createState() => _FeesCardState();
}

class _FeesCardState extends State<FeesCard> {
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
                    "${widget.feedata.type}",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Due Date:",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "${widget.feedata.duedate}",
                        style: TextStyle(fontSize: 14.0,),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Amount:",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "${widget.feedata.amount}",
                        style: TextStyle(fontSize: 14.0,),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Paid Amt:",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "${widget.feedata.payment.paidamt}",
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Balance Amount:",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "${widget.feedata.payment.balanceamt}",
                        style: TextStyle(fontSize: 14.0,),
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