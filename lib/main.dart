import 'package:assignment_todo_list/features/todos/data/providers/todo_api_provider.dart';
import 'package:assignment_todo_list/features/todos/data/repositories/todo_repository.dart';
import 'package:assignment_todo_list/features/todos/presentation/Screen/todo_list_screen.dart';
import 'package:assignment_todo_list/features/todos/presentation/blocs/todo/todo_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:assignment_todo_list/global_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = GlobalBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
      RepositoryProvider<TodoApiProvider>(
          create: (context) => TodoApiProvider()),
      RepositoryProvider<TodoRepository>(
          create: (context) =>
              TodoRepository(apiProvider: context.read<TodoApiProvider>()))
    ], child:
      MultiBlocProvider(
        providers: [
          BlocProvider<TodoBloc>(
        create: (context) => TodoBloc(
        todoRepository: context.read<TodoRepository>(),
    ),
    )
        ],
        child: MaterialApp(home: TodoListScreen(),))
    );
  }
}
