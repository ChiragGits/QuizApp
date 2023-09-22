import 'package:flutter/material.dart';

import 'package:quizz_app/start_screen.dart';
import 'package:quizz_app/result_screen.dart';
import 'package:quizz_app/question_screen.dart';
import 'package:quizz_app/data/questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void restartQuiz() {
    if (activeScreen == 'result-screen') {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'start-screen';
      });
    }
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget showScreen = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      showScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      showScreen =
          ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 26, 2, 80),
                Color.fromARGB(255, 45, 7, 98)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: showScreen),
      ),
    );
  }
}
