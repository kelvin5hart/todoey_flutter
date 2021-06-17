import 'package:flutter/material.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:todoey_flutter/widgets/task_card.dart';

class TasksList extends StatefulWidget {

  final List<Task> tasks;
  TasksList({required this.tasks});
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskCard(
          taskText: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          toggleCheckBoxState: (bool checkBoxState) {
            setState(() {
              widget.tasks[index].isDone = checkBoxState;
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
