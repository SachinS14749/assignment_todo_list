import 'package:assignment_todo_list/features/todos/data/models/todo_model.dart';
import 'package:assignment_todo_list/features/todos/presentation/blocs/todo/todo_bloc.dart';
import 'package:assignment_todo_list/features/todos/presentation/blocs/todo/todo_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoEntry extends StatelessWidget {

  final PersistentBottomSheetController? bottomSheetController;
  TodoEntry( this.bottomSheetController);

  final TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _todoController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)), // Rounded corners
                  borderSide: BorderSide(
                    color: Colors.blue, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                labelText: 'Todo'),

          ),
          SizedBox(height: 15,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
            ),
            onPressed: () {
              final todoText = _todoController.text;
              if (todoText.isNotEmpty) {
                final todoModel = TodoModel(
                    userId: 1,
                    title: todoText,
                    completed: false); // id will be set by the server
                context.read<TodoBloc>().add(AddTodoEvent(todoModel));
                bottomSheetController?.close();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please enter todo')));
              }
            },
            child: const Text('Add',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
