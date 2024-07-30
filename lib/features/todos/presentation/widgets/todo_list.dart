import 'package:assignment_todo_list/features/todos/presentation/widgets/add_todo_button.dart';
import 'package:assignment_todo_list/features/todos/presentation/widgets/todo_entry.dart';
import 'package:flutter/material.dart';

import '../../domain/entries/todo_bean.dart';

class TodoList extends StatefulWidget {
  final List<Todo> todoList;

  TodoList({super.key, required this.todoList});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool buttonVisibility = true;

  @override
  Widget build(BuildContext context) {
    String taskStatus;

    return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(children: [
          /*buttonVisibility ? AddTodoButton(click: (){
              setState(() {
                buttonVisibility = false;
              });
          }) : SizedBox(height: 1,) ,*/
          buttonVisibility ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonVisibility = false;
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blueAccent)),
                  child: const Text(
                    'Add Todo',
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ))
            ]): const SizedBox(height: 1,),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.todoList.length,
            itemBuilder: (context, index) {
              final todoItem = widget.todoList[index];
              taskStatus = todoItem.completed ? 'Completed' : 'Not complete';
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Card(
                  child: ListTile(
                      title: Text(todoItem.title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Row(
                        children: [
                          const Text('Status :'),
                          Text(
                            taskStatus,
                            style: TextStyle(
                                color: todoItem.completed
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ],
                      ),
                      onTap: () {}),
                ),
              );
            },
          ),
          TodoEntry(),
        ]));
  }
}
