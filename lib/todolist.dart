import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextEditingController tododata = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TodoApp')),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              color: Colors.grey,
              child: TextField(
                controller: tododata,
                maxLines: 8,
                decoration: InputDecoration(
                    hintText: "Enter your text here",
                    hintStyle: TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  String data = tododata.text;
                  if (data.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Alert'),
                              content: Text('Text can not be empty'),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'))
                              ],
                            ));
                  } else {
                    Navigator.pop(context, data);
                  }
                },
                child: Text(
                  'Save',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            )
          ],
        ));
  }
}
