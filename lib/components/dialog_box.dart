import 'package:flutter/material.dart';
import 'package:todo/components/todo_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: SizedBox(
        height: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TodoButton(buttonName: "Save", onPressed: onSave),
                const SizedBox(width: 8.0),
                TodoButton(buttonName: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
