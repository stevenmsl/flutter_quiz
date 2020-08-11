import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

// This will be re-built when needed
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// where you keep your state and
// it will not be reset.
// make sure you extend State<MyApp>
// a leading underscore indicates that this is a private class
class _MyAppState extends State<MyApp> {
  // widget state
  // a leading underscore indicates
  // that this is a private property
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    // the second const above
    // will make this list unmodifiable
    {
      // this is a map
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s yout favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Dog', 'score': 1},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 5},
      ]
    },
    {
      'questionText': 'What\'s yout favorite instructor?',
      'answers': [
        {'text': 'Steven', 'score': 1},
        {'text': 'Arlo', 'score': 1},
        {'text': 'Steve', 'score': 1},
        {'text': 'Arlo2', 'score': 1},
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    // notify flutter that state has changed
    // build will be called afterwards
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
