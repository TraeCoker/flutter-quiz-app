import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  final String quizId;

  const QuizScreen({ Key? key, required this.quizId }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //instantiates a custom class for managing state
      create: (_) => QuizState(), 
    );
  }
}
