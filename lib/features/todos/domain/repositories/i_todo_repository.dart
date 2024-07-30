import '../entries/todo_bean.dart';

abstract class ITodoRepository {
  Future<List<Todo>> fetchTodoList();
}
