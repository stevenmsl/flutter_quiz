import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  void _answerQuestion() {
    // notify flutter that state has changed
    // build will be called afterwards
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = const [
      // the second const above
      // will make this list unmodifiable
      {
        // this is a map
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\'s yout favorite animal?',
        'answers': ['Rabbit', 'Dog', 'Elephant', 'Lion']
      },
      {
        'questionText': 'What\'s yout favorite instructor?',
        'answers': ['Steven', 'Arlo', 'Steve', 'Arlo2']
      },
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: Column(
        children: [
          Question(questions[_questionIndex]['questionText']),
          // ... spread operator
          // use spread operator to add each Answer widget
          // in the list as an element to the children array
          ...(questions[_questionIndex]['answers'] as List<String>)
              // map returns Iterable<T>
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList() // use toList to convert it to List<Answer>
        ],
      ),
    ));
  }
}
