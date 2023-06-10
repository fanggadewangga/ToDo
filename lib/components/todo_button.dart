// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TodoButton extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;

  TodoButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: Text(buttonName, style: const TextStyle(color: Colors.white),));
  }
}
