import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        // ... spread operator
        // use spread operator to add each Answer widget
        // in the list as an element to the children array
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            // map returns Iterable<T>
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList() // use toList to convert it to List<Answer>
      ],
    );
  }
}
