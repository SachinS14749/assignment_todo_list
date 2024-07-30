import 'package:assignment_todo_list/features/todos/data/providers/todo_api_provider.dart';
import 'package:assignment_todo_list/features/todos/domain/entries/todo_bean.dart';
import 'package:assignment_todo_list/features/todos/domain/repositories/i_todo_repository.dart';
import '../models/todo_model.dart';

class TodoRepository extends ITodoRepository {
  final TodoApiProvider _todoApiProvider;

  TodoRepository({required TodoApiProvider apiProvider}) : _todoApiProvider = apiProvider;

  @override
  Future<List<Todo>> fetchTodoList() {
    return _todoApiProvider.getTodoList();
  }

  @override
  Future<Todo> addTodo(Todo todoItem) {
    final TodoModel todoModel = TodoModel(userId: todoItem.userId, title: todoItem.title, completed: todoItem.completed);
    return _todoApiProvider.addTodo(todoModel);
  }

}
