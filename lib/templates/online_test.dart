import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:smart_school/modal/online_exam.dart';
import 'package:smart_school/providers/online_exam_provider.dart';

class OnlineTest extends StatefulWidget {
  final String exam, duration;
  final List<OnlineExamData> examdata;

  const OnlineTest({this.exam, this.examdata, this.duration});
  @override
  _OnlineTestState createState() => _OnlineTestState();
}

class _OnlineTestState extends State<OnlineTest> {
  String _option = '';
  bool _load = false;

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000
        * (widget.duration.substring(0, 2) == '00' ?
          int.parse(widget.duration.substring(3, 5)) * 60
          : int.parse(widget.duration.substring(3, 5)) * 60 * 60);
    return !_load ?
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('${widget.exam}'),
          ),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text(
                    'Note',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),
                  )),
                  SizedBox(height: 10.0),
                  Text('You can select option only once and test duration'
                      ' will be ${widget.duration} minutes',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.red,
                    child: Text('Let`s Start',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: () {
                     setState(() {
                       _load = true;
                     });
                    }
                  )
                ],
              )
          ),
        ) :
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('${widget.exam}'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.timer, size: 35.0, color: Colors.blue),
                SizedBox(width: 15.0),
                CountdownTimer(
                  endTime: endTime,
                  widgetBuilder: (_, CurrentRemainingTime time) {
                    if (time == null) {
                      Navigator.of(context).pop();
                    }
                    return Text(
                        '${time?.hours??'0'+'0'}:${time?.min??'0'+'0'}:${time.sec}',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold
                        )
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 30.0),
          SizedBox(
            height: 600.0,
            child: ListView.builder(
              itemCount: widget.examdata.length-1??0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Q${index + 1}) ${OnlineExamProvider().clearData(widget.examdata[index].question)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        title: Text('(A) ${OnlineExamProvider()
                            .clearData(widget.examdata[index].optA)}'
                        ),
                        leading: Radio(
                          value: OnlineExamProvider()
                              .clearData(widget.examdata[index].optA),
                          groupValue: _option,
                          onChanged: (String value) {
                            setState(() {
                              _option = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('(B) ${OnlineExamProvider()
                            .clearData(widget.examdata[index].optB)}'
                        ),
                        leading: Radio(
                          value: OnlineExamProvider()
                              .clearData(widget.examdata[index].optB),
                          groupValue: _option,
                          onChanged: (String value) {
                            setState(() {
                              _option = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('(C) ${OnlineExamProvider()
                            .clearData(widget.examdata[index].optC)}'
                        ),
                        leading: Radio(
                          value: OnlineExamProvider()
                              .clearData(widget.examdata[index].optC),
                          groupValue: _option,
                          onChanged: (String value) {
                            setState(() {
                              _option = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('(D) ${OnlineExamProvider()
                            .clearData(widget.examdata[index].optD)}'
                        ),
                        leading: Radio(
                          value: OnlineExamProvider()
                              .clearData(widget.examdata[index].optD),
                          groupValue: _option,
                          onChanged: (String value) {
                            setState(() {
                              _option = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('(E) ${OnlineExamProvider()
                            .clearData(widget.examdata[index].optE)}'
                        ),
                        leading: Radio(
                          value: OnlineExamProvider()
                              .clearData(widget.examdata[index].optE),
                          groupValue: _option,
                          onChanged: (String value) {
                            setState(() {
                              _option = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }

}
