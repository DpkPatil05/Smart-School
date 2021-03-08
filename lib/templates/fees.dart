import 'package:flutter/material.dart';
import 'package:smart_school/modal/fees.dart';

class FeesCard extends StatefulWidget {
  final List<FeesData> feedata;
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
                    "${widget.feedata[widget.feedata.length-1].type}",
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
                  child: Row(

                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Text(
                              "Fees Code:",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "${widget.feedata[widget.feedata.length-1].code}",
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
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
                              "${widget.feedata[widget.feedata.length-1].duedate}",
                              style: TextStyle(fontSize: 14.0,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                            "${widget.feedata[widget.feedata.length-1].amount}",
                            style: TextStyle(fontSize: 14.0,),
                          ),
                        ],
                      ),
                      0 >= widget.feedata.length-1 ?
                      SizedBox(width: 8.0)
                      : FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.monetization_on,
                                size: 30.0,
                                color: Colors.green,
                              ),
                              SizedBox(width: 8.0),
                              Text('Payments')
                            ],
                          ),
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) => ListView.builder(
                              itemCount: 0 == widget.feedata.length-1??0,
                              itemBuilder: (BuildContext context, int index) =>
                                  ExpansionTile(
                                    title: Text('${widget.feedata[index].paiddt}'),
                                    children: [
                                      ListTile(
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Text('Pay ID:',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 8.0),
                                                      Text('${widget.feedata[index].payid}'),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Text('Pay Mode:',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 8.0),
                                                      Text('${widget.feedata[index].paymode}'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Text('Paid:',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 8.0),
                                                      Text('${widget.feedata[index].paidamt}'),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Text('Balance:',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 8.0),
                                                      Text('${widget.feedata[index].balanceamt}'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Text('Discount:',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 8.0),
                                                      Text('${widget.feedata[index].discnt}'),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Text('Fine:',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 8.0),
                                                      Text('${widget.feedata[index].fine}'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                            )
                          )
                      ),
                      SizedBox(width: 10.0)
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