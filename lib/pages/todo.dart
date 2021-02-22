import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}
class _TodoState extends State<Todo> {
  final textEditingController = TextEditingController();
  final _controller = TextEditingController();

  Widget _buildMultilineTextField() {
    return TextField(
      controller: this._controller,
      maxLines: 5,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counterText: '${this._controller.text.split(' ').length}',
        labelText: 'Description',
        hintText: 'Add your description',
        border: const OutlineInputBorder(),
      ),
      onChanged: (text) => setState(() {}),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => Container(
                  alignment: Alignment.center,
                  height: 800.0,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.title),
                                hintText: 'Add your title',
                                labelText: 'Title',
                              ),
                              controller: textEditingController,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            _buildMultilineTextField()
                          ],
                        ),
                      )
                    ],
                  ),
              ),
            ),
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.white,
          child:ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            ListTile(
                              title: Text('title'),
                              subtitle: Text('describtion'),
                            )
                          ]
                      ),
                    )
                );
              }
          ),
        )
    );
  }
}
