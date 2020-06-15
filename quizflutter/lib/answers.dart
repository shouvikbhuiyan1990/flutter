import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String answerText;
  final Function choseAnswer;

  Answers(this.answerText, this.choseAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        padding: EdgeInsets.all(10),
        onPressed: () => choseAnswer(answerText),
        child: Text(
          answerText,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
