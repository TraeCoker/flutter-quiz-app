import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/quiz/quiz_state.dart';
import 'package:quizapp/services/services.dart';
import 'package:quizapp/shared/shared.dart';


class QuizScreen extends StatelessWidget {
  final String quizId;

  const QuizScreen({ Key? key, required this.quizId }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //instantiates a custom class for managing state
      create: (_) => QuizState(), 
      //grab quiz from firestore database
      child: FutureBuilder<Quiz>(
        future: FirestoreService().getQuiz(quizId),
        builder: (context, snapshot) {
          var state = Provider.of<QuizState>(context);

          if (!snapshot.hasData || snapshot.hasError) {
            return Loader();
          } else {
            var quiz = snapshot.data!;
  
            return Scaffold(
              appBar: AppBar(
                title: AnimatedProgressbar(value: state.progress),
                //lets user exit quiz early
                leading: IconButton(
                  icon: const Icon(FontAwesomeIcons.times),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              body: PageView.builder(
                //keep users from swiping between pages
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: state.controller,
                onPageChanged: (int idx) => 
                    state.progress = (idx / (quiz.questions.length + 1)),
                itemBuilder: (BuildContext context, int idx) {
                  if (idx == 0) {
                    return StartPage(quiz: quiz);
                  } else if (idx == quiz.questions.length + 1) {
                    return CongratsPage(quiz: quiz);
                  } else {
                    return QuestionPage(question: quiz.questions[idx - 1]);
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class StartPage extends StatelessWidget {
  final Quiz quiz;
  const StartPage({ Key? key, required this.quiz }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(quiz.title, style: Theme.of(context).textTheme.headline4),
          const Divider(),
          Expanded(child: Text(quiz.description)),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                //animates page view to next page
                onPressed: state.nextPage, 
                label: const Text('Start Quiz!'),
                icon: const Icon(Icons.poll),
              )
            ],
          )
        ],
      ),
    );
  }
}
