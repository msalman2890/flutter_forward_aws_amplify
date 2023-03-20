
import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/Todo.dart';

class TodoOperations {

  //Todo: Add DataModel to the cloud app
  //Todo 7: Define the saveTodo method
  static Future<void> saveTodo({
    required String title,
    required String description,
  }) async {
    try {
      Amplify.DataStore.save(
        Todo(
          userId: (await Amplify.Auth.getCurrentUser()).userId,
          title: title,
          description: description,
        ),
      );
    } catch (e) {
      print('Could not save Todo');
    }
  }


  //Todo 8: Define the markTodoCompleted method

}
