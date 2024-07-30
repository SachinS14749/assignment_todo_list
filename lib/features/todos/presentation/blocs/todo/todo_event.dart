import 'package:assignment_todo_list/features/todos/data/models/todo_model.dart';

abstract class TodoEvent {}

class FetchTodoEvent extends TodoEvent{}

class AddTodoEvent extends TodoEvent {
  final TodoModel todoModel;
  AddTodoEvent(this.todoModel);
}

