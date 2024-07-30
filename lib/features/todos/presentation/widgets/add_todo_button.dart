import 'package:flutter/material.dart';

class AddTodoButton extends StatelessWidget {
  final Function()? click;

  AddTodoButton({super.key, required this.click});

  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
                onPressed: () {
                  click;
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blueAccent)),
                child: const Text(
                  'Add Todo',
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ))
      ]);
  }
}
