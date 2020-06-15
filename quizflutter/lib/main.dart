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
  int questionCount = 0;
  final _questions = [
    {
      'title': 'Which is the smallest of them?',
      'answers': ['Cat', 'Dog', 'Mouse']
    },
    {
      'title': 'Find the odd one out?',
      'answers': ['Honey', 'Cheese', 'Mozerrela']
    },
    {
      'title': 'Who is the oldest of them all?',
      'answers': ['Gandalf', 'Harry', 'Dobby the elf']
    }
  ];

  _choseAnswer() {
    setState(() {
      questionCount++;
    });
  }

  _resetQuiz() {
    setState(() {
      questionCount = 0;
    });
  }

  _restartQuiz() {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'You have completed the quiz',
            style: TextStyle(height: 10),
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: _resetQuiz,
          )
        ],
      ),
    );
  }

  _beginQuiz() {
    return Column(
      children: <Widget>[
        Question(_questions[questionCount]['title']),
        ...(_questions[questionCount]['answers'] as List<String>)
            .map((e) => Answers(e, _choseAnswer))
            .toList()
      ],
    );
  }

  _buildQuiz() {
    if (questionCount >= _questions.length) {
      return _restartQuiz();
    } else {
      return _beginQuiz();
    }
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
