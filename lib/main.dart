import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  int _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        "questionText": 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1},
        ]
      },
      {
        "questionText": 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Dog', 'score': 10},
          {'text': 'Cat', 'score': 5},
          {'text': 'Elephant', 'score': 3},
          {'text': 'Lion', 'score': 1}
        ]
      },
      {
        "questionText": 'What\'s your favorite food?',
        'answers': [
          {'text': 'chickin', 'score': 10},
          {'text': 'hamburger', 'score': 5},
          {'text': 'colar', 'score': 3},
          {'text': 'cheese', 'score': 1},
        ]
      },
    ];

    _answerQuestion(int score) {
      _totalScore += score;
      setState(() {
        _questionIndex += 1;
      });
    }

    _resetQuiz() {
      setState(() {
        _totalScore = 0;
        _questionIndex = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My First App',
          ),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
