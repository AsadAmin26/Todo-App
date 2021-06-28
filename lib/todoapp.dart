import 'package:flutter/material.dart';
import 'package:todoapp/todolist.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<dynamic> items = [1, 2, 3];
  var data = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
                  height: 120,
                  color: Colors.green,
                  margin: EdgeInsets.only(top: 15),
                  child: ListTile(
                    title: Text(
                      '${items[index]}',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('Edit Note'),
                                        content: TextField(
                                          onChanged: (value) {
                                            data = value;
                                          },
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  items.replaceRange(
                                                      index, index + 1, {data});
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Add'))
                                        ],
                                      ));
                            },
                            child: Icon(Icons.edit),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoList(),
              ));
          setState(() {
            items.add(result);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
