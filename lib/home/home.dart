import 'package:flutter/material.dart';
import 'package:quizapp/login/login.dart';
import 'package:quizapp/topics/topics.dart';
import 'package:quizapp/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      //builds out different UI based on the state of stream
      builder: (context, snapshot) {
        //4 states to handle
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('error'),
            );
        } else if (snapshot.hasData) {
          //if hasData user is logged in
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
