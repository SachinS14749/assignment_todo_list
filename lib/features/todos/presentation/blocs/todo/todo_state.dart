import '../../../domain/entries/todo_bean.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}
class TodoAdding extends TodoState {}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
}

class TodoLoaded extends TodoState {
  final List<Todo> todoList;
  TodoLoaded(this.todoList);
}

class TodoAdded extends TodoState {
  final Todo todo;
  TodoAdded(this.todo);
}
