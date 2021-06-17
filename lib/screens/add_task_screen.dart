import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack;
  AddTaskScreen({required this.addTaskCallBack});

  @override
  Widget build(BuildContext context) {
    TextEditingController newTaskTitle = TextEditingController();
    return Container(
      color: Color(0xff666870),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: newTaskTitle,
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Task',
                  labelStyle: TextStyle(color: Color(0xff8893c1), fontSize: 20),
                  hintText: 'Add Task',
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 20),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xff8893c1))),
              onPressed: () {
                addTaskCallBack(newTaskTitle.text);
                Navigator.pop(context);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
