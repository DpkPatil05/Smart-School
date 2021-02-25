import 'package:flutter/material.dart';
import 'package:smart_school/modal/online_exam.dart';
import 'package:smart_school/providers/online_exam_provider.dart';

class OnlineTest extends StatefulWidget {
  final String exam;
  final List<OnlineExamData> examdata;

  const OnlineTest({this.exam, this.examdata});
  @override
  _OnlineTestState createState() => _OnlineTestState();
}

class _OnlineTestState extends State<OnlineTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text('${widget.exam}')),
      ),
      body: ListView.builder(
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
                ListTile(title: Text('(A) ${OnlineExamProvider().clearData(widget.examdata[index].optA)}')),
                ListTile(title: Text('(B) ${OnlineExamProvider().clearData(widget.examdata[index].optB)}')),
                ListTile(title: Text('(C) ${OnlineExamProvider().clearData(widget.examdata[index].optC)}')),
                ListTile(title: Text('(D) ${OnlineExamProvider().clearData(widget.examdata[index].optD)}')),
                ListTile(title: Text('(E) ${OnlineExamProvider().clearData(widget.examdata[index].optE)}')),
              ],
            ),
          );
        }
      ),
    );
  }
}
