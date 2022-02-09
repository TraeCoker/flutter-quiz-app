import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/services/services.dart';
import 'package:quizapp/shared/shared.dart';
import 'package:quizapp/topics/topic_item.dart';
import 'package:quizapp/topics/drawer.dart';


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
          return Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('topics'),
            ),

            drawer: TopicDrawer(topics: topics),

            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
            bottomNavigationBar: const BottomNavBar(),
          );
        } else {
          return const Text('No topics found in Firestore. Check database');
        }
      },
    );
      
  }
}