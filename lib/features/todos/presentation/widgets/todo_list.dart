import 'package:assignment_todo_list/features/todos/presentation/widgets/add_todo_button.dart';
import 'package:assignment_todo_list/features/todos/presentation/widgets/todo_entry.dart';
import 'package:flutter/material.dart';

import '../../domain/entries/todo_bean.dart';

class TodoList extends StatefulWidget {
  final List<Todo> todoList;

  TodoList({super.key, required this.todoList});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool buttonVisibility = true;

  @override
  Widget build(BuildContext context) {
    String taskStatus;
    return Scaffold(
      body: Column(
          children: [
        buttonVisibility ?
        Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      bottomSheet();
                      buttonVisibility = false;
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blueAccent)),
                  child: const Text(
                    'Add Todo',
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            )
          ]): const SizedBox(),

       SizedBox(height: 15.0,),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.todoList.length,
            itemBuilder: (context, index) {
              final todoItem = widget.todoList[index];
              taskStatus = todoItem.completed ? 'Completed' : 'Not complete';
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Card(
                  child: ListTile(
                      title: Text(todoItem.title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Row(
                        children: [
                          const Text('Status :'),
                          Text(
                            taskStatus,
                            style: TextStyle(
                                color: todoItem.completed
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ],
                      ),
                      onTap: () {}),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }

   PersistentBottomSheetController bottomSheet(){
     PersistentBottomSheetController? bottomSheetController;
    return bottomSheetController =  Scaffold.of(context).showBottomSheet((context) {
        return Container(
          color: Colors.white10,
          height: 170,
          child: Center(
            child: TodoEntry(bottomSheetController)
          ),
        );
      },
    );
   }
}
