import 'package:flutter/material.dart';

import '../classes/todo_operations.dart';

class TodoForm extends StatelessWidget {
  TodoForm({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              style: const TextStyle(
                  color: Colors.white
              ),
              decoration: const InputDecoration(
                hintText: 'Enter Title',
              ),
              controller: titleController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              style: const TextStyle(
                  color: Colors.white
              ),
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              maxLines: 5,
              controller: descriptionController,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                // Todo 9: Call method to save the todo
                await TodoOperations.saveTodo(title: titleController.text, description: descriptionController.text);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 50),
                  backgroundColor: const Color(0xff8687E7)),
              child: Text(
                "Add Task",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
