import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // final - the property
  // cannot be changed after
  // it has been initialized
  // in the constructor
  final String questionText;
  // if the input data has changed
  // it will trigger a re-rendering
  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    // container -> Margin -> Border -> Padding -> Child
    return Container(
        width: double.infinity, // Take up as much space as it can
        // Call the all method, one of the instructors defined
        // on the EdgeInset class to set the margin
        margin: EdgeInsets.all(10),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}
