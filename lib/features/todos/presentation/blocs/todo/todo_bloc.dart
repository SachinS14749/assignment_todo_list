import 'package:assignment_todo_list/features/todos/data/repositories/todo_repository.dart';
import 'package:assignment_todo_list/features/todos/domain/entries/todo_bean.dart';
import 'package:assignment_todo_list/features/todos/presentation/blocs/todo/todo_event.dart';
import 'package:assignment_todo_list/features/todos/presentation/blocs/todo/todo_state.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/entries/todo_bean.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc({required this.todoRepository}) : super(TodoInitial()) {
    on<FetchTodoEvent>((event, emit) async {
      emit(TodoLoading());
      try {
        final todoList = (await todoRepository.fetchTodoList());
        emit(TodoLoaded(todoList));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });

    on<AddTodoEvent>((event, emit) async {
      emit(TodoLoading());
      try {
        final todo = await todoRepository.addTodo(event.todoModel);
        emit(TodoAdded(todo));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
  }
}
