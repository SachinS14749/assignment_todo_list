import 'package:assignment_todo_list/features/todos/data/models/todo_model.dart';
import 'package:assignment_todo_list/features/todos/presentation/blocs/todo/todo_bloc.dart';
import 'package:assignment_todo_list/features/todos/presentation/blocs/todo/todo_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoEntry extends StatelessWidget {
  TodoEntry({super.key});

  final TextEditingController _todoController = TextEditingController();

  bool inputVisibility = false;

  @override
  Widget build(BuildContext context) {
    return inputVisibility
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _todoController,
                  decoration: const InputDecoration(labelText: 'Todo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final todoText = _todoController.text;
                    if (todoText.isNotEmpty) {
                      final todoModel = TodoModel(
                          userId: 1,
                          title: todoText,
                          completed: false); // id will be set by the server
                      context.read<TodoBloc>().add(AddTodoEvent(todoModel));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please enter todo')));
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          )
        : SizedBox(
            height: 1,
          );
  }
}
