import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/widgets/categories_card.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Sugar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee2f7),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen(addTaskCallBack:(newTaskTitle){
                setState(() {
                  tasks.add(Task(name: newTaskTitle));
                });
              }),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Color(0xff8893c1),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.list_rounded,
                          color: Color(0xff8893c1),
                          size: 40,
                        ),
                        Spacer(
                          flex: 10,
                        ),
                        Icon(
                          Icons.search,
                          color: Color(0xff8893c1),
                          size: 40,
                        ),
                        Spacer(),
                        Icon(
                          Icons.notifications,
                          color: Color(0xff8893c1),
                          size: 40,
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Text(
                        "What's Up, Kelvin!",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Text(
                        "CATEGORIES",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38),
                      )),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CategoriesCard(
                            tasksNumber: '40 Tasks', category: 'Business'),
                        CategoriesCard(
                            tasksNumber: '18 Tasks', category: 'Personal'),
                        CategoriesCard(
                            tasksNumber: '5 Tasks', category: 'Hobby')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Text(
                        "TODAY'S TASK",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38),
                      )),
                ],
              ),
              Expanded(
                child: TasksList(tasks: tasks,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
