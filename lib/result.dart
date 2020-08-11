import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  // getter
  String get resultPhrase {
    var resultText = 'You did it - never mind the result';
    if (resultScore <= 8) {
      resultText = "Your score is 8 or below";
    } else if (resultScore <= 12) {
      resultText = "Your score is between 9 and 12";
    } else if (resultScore <= 16) {
      resultText = "Your score is between 13 and 16";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Restart Quiz!'),
          textColor: Colors.blue,
          onPressed: resetHandler,
        )
      ],
    ));
  }
}
