import '../../domain/entries/todo_bean.dart';

class TodoModel extends Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoModel({required this.userId,
    required this.id,
    required this.title,
    required this.completed})
      : super(userId: userId, id: id, title: title, completed: completed);

  factory TodoModel.createTodoModel(Map<String, dynamic> responseJsonItem) {
    return TodoModel(userId: responseJsonItem['userId'],
        id: responseJsonItem['id'],
        title: responseJsonItem['title'],
        completed: responseJsonItem['completed']);
  }

  Map<String, dynamic> todoModelToJson() {
    return {'userId': userId,
      'id': id,
      'title': title,
      'completed': completed
    };
  }
}
