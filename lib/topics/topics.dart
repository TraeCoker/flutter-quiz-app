import 'package:flutter/material.dart';
import 'package:quizapp/services/services.dart';
import 'package:quizapp/shared/shared.dart';
import 'package:quizapp/shared/loading.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //takes a future and builds out UI based on the state of that future
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const LoadingScreen();
        } else if (snapshot.hasError) {

        } else if (snapshot.hasData) {

        } else {

        }
      },
    );
      
  }
}