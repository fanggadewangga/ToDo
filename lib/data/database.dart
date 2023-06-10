import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  // reference to box
  final _myBox = Hive.box('mybox');

  // load data from db
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  // update data
  void updateData() {
    _myBox.put("TODOLIST", todoList);
  }
}
