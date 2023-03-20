import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forward_aws_amplify/views/todo_list.dart';

import 'classes/aws_amplify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Todo 3: Initialize Amplify
  AWSAmplify.configureAmplify();
  // Todo 4: Pull Amplify App from cloud

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Todo 5: Enable Auth and Add Amplify Authenticator to MaterialApp
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        title: 'Flutter Forward Extended AWS Amplify Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.black,
                titleTextStyle: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white)
            ),
            inputDecorationTheme: const InputDecorationTheme(
              iconColor: Color(0xffAFAFAF),
              hintStyle: TextStyle(
                  color: Color(0xffAFAFAF)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xffAFAFAF), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xff8687E7), width: 2),
              ),
            )
        ),
        home: const TodoList(),
      ),
    );
  }
}