import 'dart:async';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forward_aws_amplify/views/todo_form.dart';

import '../models/Todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // Todo 10: Make a list of todos
  List<Todo> _todos = [];

  // Todo 11: Make a stream controller to subscribe to the Todo model stream
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
    // Todo 13: Start listening to the Todo model stream
    _startListening();
  }

  Future<void> _startListening() async {
    // Todo 12: Subscribe to the Todo model stream
    _streamSubscription =
        Amplify.DataStore.observeQuery(Todo.classType).listen((event) {
          setState(() {
            _todos = event.items;
          });
        });
  }

  @override
  void dispose() {
    super.dispose();
    // Todo 14: Cancel the subscription
    _streamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TodoForm()));
        },
        backgroundColor: const Color(0xff8687E7),
        elevation: 10,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search for your task...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Todo 15: Display the list of todos
            Expanded(child: _emptyWidget())
          ],
        ),
      ),
    );
  }

  // Widget _todoCard(Todo todo) {
  //   return ListTile(
  //     title:
  //         Text(todo.title, style: TextStyle(color: Colors.white, fontSize: 18)),
  //     subtitle: Text(
  //       todo.description,
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     tileColor: const Color(0xff363636),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //   );
  // }
  //
  // Widget _displayTodoCard(Todo todo) {
  //   if (!(todo.isCompleted ?? false)) {
  //     return _todoCard(todo);
  //   }
  //   return Banner(
  //     message: 'Completed',
  //     location: BannerLocation.topEnd,
  //     color: const Color(0xff8687E7),
  //     child: _todoCard(todo),
  //   );
  // }

  Widget _emptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/todo.png'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'What do you want to do today?',
            style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Colors.white
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Tap + to add your tasks',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
