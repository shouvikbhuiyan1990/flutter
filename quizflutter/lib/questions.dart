import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Text(
        questionText,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
