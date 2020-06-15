import 'package:flutter/material.dart';
import './questions.dart';
import './answers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizContainer(),
    );
  }
}

class QuizContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      QuizState(); //just a short hand for single return functions
}

class QuizState extends State<QuizContainer> {
  final _questions = [
    {
      'title': 'Which is the smallest of them?',
      'answers': ['cat', 'dog', 'mouse']
    },
    {
      'title': 'Find the odd one out?',
      'answers': ['honey', 'cheese', 'mozerrela']
    },
    {
      'title': 'Who is the oldest of them all?',
      'answers': ['Gandalf', 'Harry', 'Dobby the elf']
    }
  ];

  _choseAnswer() {
    print('answer given');
  }

  _buildQuiz() {
    return Column(
      children: <Widget>[
        Question(_questions[0]['title']),
        ...(_questions[0]['answers'] as List<String>)
            .map(
              (e) => Answers(e, _choseAnswer)
            )
            .toList()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer the Below Questions'),
      ),
      body: _buildQuiz(),
    );
  }
}
