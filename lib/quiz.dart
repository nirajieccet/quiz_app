import 'package:flutter/material.dart';
import 'package:my_quiz_app/questions_screen.dart';
import 'package:my_quiz_app/start_screen.dart';
import 'package:my_quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}
class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start_screen'; //= const StartScreen(switchScreen);

  void switchScreen() {
    setState(() {
      activeScreen = activeScreen = 'questions_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if(selectedAnswer.length == questions.length) {
      selectedAnswer = [];
      setState(() {
        activeScreen = activeScreen = 'start_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidget = activeScreen == 'start_screen'
        ? StartScreen(switchScreen)
        : QuestionScreen(onSelectAnswer: chooseAnswer,);

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }

}