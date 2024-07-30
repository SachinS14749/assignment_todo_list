import '../../data/models/todo_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoApiProvider {
  ///Function to hit get TodoItems API and return the TodoList
  Future<List<TodoModel>> getTodoList() async {
    //hit the Get API
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList
          .map((jsonItem) => TodoModel.createTodoModel(jsonItem))
          .toList();
    } else {
      throw Exception('Failed to load Todo items...');
    }
  }

  Future<TodoModel> addTodo(TodoModel todoModel) async {
    final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode(todoModel.todoModelToJson()));

    if (response.statusCode == 201 || response.statusCode == 200) {
      return TodoModel.createTodoModel(json.decode(response.body));
    } else {
      throw Exception('Failed to add todo item..');
    }
  }
}
