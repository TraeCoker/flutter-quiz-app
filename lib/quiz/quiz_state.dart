import 'package:flutter/material.dart';
import 'package:quizapp/services/services.dart';

class QuizState with ChangeNotifier {
  //ChangeNotifier mixin gives us access to notifyListeners
  //tell flutter framework to re-render when data has changed
  double _progress = 0;
  Option? _selected;

  double get progress => _progress;
  Option? get selected => _selected;

  final PageController controller = PageController();

  set progress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  set selected(Option? newValue) {
    _selected = newValue;
    notifyListeners();
  }

  void nextPage() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 500),
       curve: Curves.easeOut,
    );
  }
}