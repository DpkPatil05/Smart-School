import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';
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

  Color _setColor(bool answered, String selected, String option, String answer) {
    if(!answered)
      return Colors.white;
    else {
      return selected.substring(5, 10) == answer.substring(7, 12) ? Colors.green : Colors.red;
    }
  }

  void _selectOption(bool selected, String qtID, String value, OnlineExamProvider olXamProv) {
    if(selected)
      return;
    else {
      setState(() {
        olXamProv.saveAnswer(qtID, value);
        _option = value;
      });
    }
  }

  Widget _options(String qtID, String option, String selected, String answer) {
    var olXamProv = Provider.of<OnlineExamProvider>(context, listen: true);
    if(olXamProv.checkSelected(selected)) this._option = selected;
    return Card(
      color: _setColor(olXamProv.checkSelected(qtID), selected, _option, answer),
      shadowColor: Colors.red,
      child: Container(
        height: 80.0,
        child: Center(
          child: ListTile(
            title: Text('$option',
            style: TextStyle(fontSize: 17.0)),
            leading: Radio(
              value: selected,
              groupValue: _option,
              onChanged: (String value) {
                _selectOption(olXamProv.checkSelected(qtID), qtID, value, olXamProv);
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    OnlineExamProvider().selectedOptions.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var olExamProv = Provider.of<OnlineExamProvider>(context, listen: false);
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000
        * (widget.duration.substring(0, 2) == '00' ?
          int.parse(widget.duration.substring(3, 5)) * 60
          : int.parse(widget.duration.substring(0, 2)) * 60 * 60);
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  child: Text('Let`s Start',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () {setState(() {_load = true;});}
                )
              ]
            )
        )
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
                      olExamProv.submitTest();
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
            height: 550.0,
            child: PageView.builder(
              itemCount: widget.examdata.length-1??0,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: ListTile(
                    title: Card(
                      shadowColor: Colors.green,
                      child: SizedBox(
                        height: 80.0,
                        width: 350.0,
                        child: Center(
                          child: Text('Q${index + 1}) ${olExamProv
                              .clearData(widget.examdata[index].question)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                            ),
                          ),
                        ),
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        _options((index+1).toString(),
                            '(A) ${olExamProv.clearData(widget.examdata[index].optA)}',
                            '(Qt${index+1})OPT_A',
                            '${widget.examdata[index].answer}'
                        ),
                        _options((index+1).toString(),
                            '(B) ${olExamProv.clearData(widget.examdata[index].optB)}',
                            '(Qt${index+1})OPT_B',
                            '${widget.examdata[index].answer}'
                        ),
                        _options((index+1).toString(),
                            '(C) ${olExamProv.clearData(widget.examdata[index].optC)}',
                            '(Qt${index+1})OPT_C',
                            '${widget.examdata[index].answer}'
                        ),
                        _options((index+1).toString(),
                            '(D) ${olExamProv.clearData(widget.examdata[index].optD)}',
                            '(Qt${index+1})OPT_D',
                            '${widget.examdata[index].answer}'
                        ),
                        _options((index+1).toString(),
                            '(E) ${olExamProv.clearData(widget.examdata[index].optE)}',
                            '(Qt${index+1})OPT_E',
                            '${widget.examdata[index].answer}'
                        ),
                        index == widget.examdata.length-2 ?
                          Container(
                            width: 300.0,
                            child: RaisedButton(
                              color: Colors.red,
                              onPressed: () {
                                  olExamProv.submitTest();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                              },
                              child: Text('Submit',
                              style: TextStyle(color: Colors.white))
                            ),
                          ) : SizedBox(height: 5.0)
                      ],
                    ),
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
