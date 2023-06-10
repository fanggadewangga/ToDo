// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.isTaskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: isTaskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Colors.blue,
              ),

              // task name
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                    decoration: isTaskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
