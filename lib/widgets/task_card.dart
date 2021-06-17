import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String taskText;
  final bool isChecked;
  final Function toggleCheckBoxState;

  TaskCard(
      {required this.taskText,
      required this.isChecked,
      required this.toggleCheckBoxState});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      color: Color(0xff8893c1),
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.deepPurpleAccent,
            value: isChecked,
            onChanged: (value) {
              toggleCheckBoxState(value);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          Text(taskText,
              style: TextStyle(
                  fontSize: 20,
                  decoration: isChecked ? TextDecoration.lineThrough : null))
        ],
      ),
    );
  }
}
