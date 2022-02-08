class Topic {
  final String id;
  final String title;
  final String description;
  final String img;
  final List<Quiz> quizzes;

  Topic({
    //better to set default value than make value nullable
    this.id = '',
    this.title = '',
    this.description = '',
    this.img = 'default.png',
    this.quizzes = const []
  });
}

class Quiz {
  String id;
  String title;
  String description;
  String video;
  String topic;
  List<Question> questions;

  Quiz(
      {this.title = '',
      this.video = '',
      this.description = '',
      this.id = '',
      this.topic = '',
      this.questions = const []});
  
}

class Report {
  String uid;
  int total;
  Map topics;

  Report({
    this.uid = '', 
    this.topics = const {}, 
    this.total = 0});

}

class Question {
  String text;
  List<Option> options;

  Question({
    this.options = const [], 
    this.text = ''
  });

}

class Option {
  String value;
  String detail;
  bool correct;

  Option({
    this.value = '', 
    this.detail = '', 
    this.correct = false
  });
}