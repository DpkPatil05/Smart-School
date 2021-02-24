import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:smart_school/modal/todo.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}
class _TodoState extends State<Todo> {

  Box<TodoModel> todoBox;

  final textEditingController = TextEditingController();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    todoBox = Hive.box<TodoModel>('todos');
  }

  Future<bool> _onPressed(int index, Box<TodoModel> todoBox){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Are You Sure?'),
            content: Text('You are going to delete todo!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: (){
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: (){
                  todoBox.deleteAt(index);
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        }
    );
  }

  Widget _buildMultilineTextField() {
    return SizedBox(
      width: 390.0,
      child: TextField(
        controller: _controller,
        maxLines: 5,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          counterText: '${this._controller.text.split(' ').length}',
          labelText: 'Description',
          hintText: 'Add your description',
          border: const OutlineInputBorder(),
        ),
      ),
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
                            SizedBox(height: 20.0),
                            _buildMultilineTextField()
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Center(
                        child: ButtonTheme(
                          child: RaisedButton(
                              color: Colors.red,
                              child: Text(
                                  'Add Todo',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white
                                  )
                              ),
                              onPressed: () {
                                final String title = textEditingController.text;
                                final String description = _controller.text;

                                TodoModel todo = TodoModel(title: title, description: description);
                                todoBox.add(todo);
                                Navigator.pop(context);
                              }
                          ),
                        ),
                      ),
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
          child: ValueListenableBuilder(
            valueListenable: todoBox.listenable(),
            builder: (BuildContext context, Box<TodoModel> todos, _) {
              List<int> keys = todos.keys.cast<int>().toList();
              return 0 == keys.length?
              Card(
                child: Center(
                    child: Text(
                      "Press + button to add new todo",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                      ),
                    )
                ),
              ) : ListView.separated(
                  itemBuilder: (_, index) {
                    final int key = keys[index];
                    final TodoModel todo = todos.get(key);
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(todo.title,
                              style: TextStyle(fontSize: 22.0)),
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _onPressed(index, todoBox);
                              }
                          ),
                        ],
                      ),
                      subtitle: Text(todo.description,
                          style: TextStyle(fontSize: 18.0)),
                    );
                  },
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: keys.length,
                shrinkWrap: true,
              );
            },
          )
        )
    );
  }
}
