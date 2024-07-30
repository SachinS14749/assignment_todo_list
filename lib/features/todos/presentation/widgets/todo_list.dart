import 'package:flutter/material.dart';

import '../../domain/entries/todo_bean.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todoList;

  const TodoList({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    String taskStatus;

    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        final todoItem = todoList[index];
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
                          color:
                              todoItem.completed ? Colors.green : Colors.red),
                    ),
                  ],
                ),
                onTap: () {

                }),
          ),
        );
      },
    );
  }
}
