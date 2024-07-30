import 'dart:ui';

import 'package:assignment_todo_list/features/todos/presentation/blocs/todo/todo_bloc.dart';
import 'package:assignment_todo_list/features/todos/presentation/blocs/todo/todo_event.dart';
import 'package:assignment_todo_list/features/todos/presentation/blocs/todo/todo_state.dart';
import 'package:assignment_todo_list/features/todos/presentation/widgets/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<TodoBloc, TodoState>(
                listener: (context, state) {
                  if (state is TodoError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error : ${state.message}')));
                  } else if (state is TodoAdded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added: ${state.todo.title}')));
                    // context.read<TodoBloc>().add(FetchTodoEvent());
                  }
                },
                builder: (context, state) {
                  if (state is TodoInitial) {
                    context.read<TodoBloc>().add(FetchTodoEvent());
                    return const Center(child: Text(''));
                  } else if (state is TodoLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TodoLoaded) {
                    return TodoList(todoList: state.todoList);
                  } else if (state is TodoLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Failed to fetch Todo list'),
                        ElevatedButton(
                            onPressed: () {
                              context.read<TodoBloc>().add(FetchTodoEvent());
                            },
                            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blueAccent)),
                            child: const Text(
                              'Retry',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ));
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // context.read<TodoBloc>().add(AddTodoEvent(todoModel));
          },
          child: const Icon(Icons.add),
        ));
  }
}
