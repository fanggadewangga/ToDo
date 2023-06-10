import 'package:flutter/material.dart';
import 'package:todo/components/dialog_box.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    db.loadData();
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // checknox was tapped
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  // save a new task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  // create a new task
  void createANewTask() {
    setState(() {
      _controller.clear();
    });
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: const Text('TO DO'),
          elevation: 0,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createANewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.todoList[index][0],
              isTaskCompleted: db.todoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
