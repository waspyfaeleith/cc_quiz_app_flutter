import 'package:cc_quiz_app/components/rounded_button.dart';
import 'package:cc_quiz_app/models/question.dart';
import 'package:flutter/material.dart';
import 'package:cc_quiz_app/data/question_data.dart';
import 'package:quiz_view/quiz_view.dart';

import 'models/question_list.dart';

QuestionList _questions = QuestionList("Basics");

void populateQuestionList() {
  //_questions = QuestionList("Basics");
  for (Question question in basicQuestions) {
    _questions.addQuestion(question);
  }
}

void main() {
  populateQuestionList();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeClan Revision Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CodeClan Revision Quiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _score = 0;
  Question _currentQuestion = _questions.getQuestion();
  bool _quizComplete = false;

  void _getNextQuestion() {
    if (_questions.isFinished() == false) {
      _questions.nextQuestion();
      setState(() {
        _currentQuestion = _questions.getQuestion();
      });
    } else {
      setState(() {
        _quizComplete = true;
      });
    }
  }

  void _reset() {
    _questions.reset();
    setState(() {
      _currentQuestion = _questions.getQuestion();
      _score = 0;
    });

  }

  void _incrementScore() {
    setState(() {
      _score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_quizComplete == false) ...[
              QuizView(
                showCorrect: false,
                tagBackgroundColor: Colors.blue,
                tagColor: Colors.black,
                questionTag: "Question: ${_questions.currentQuestionNumber()+1}",
                answerColor: Colors.black54,
                answerBackgroundColor: Colors.white,
                questionColor: Colors.white,
                backgroundColor: Colors.blue,
                width: 600,
                height: 600,
                question: _currentQuestion.questionText,
                rightAnswer: _currentQuestion.rightAnswer,
                wrongAnswers: _currentQuestion.wrongAnswers,
                onRightAnswer: () => {
                  print("Right"),
                  _incrementScore(),
                  _getNextQuestion(),
                },
                onWrongAnswer: () => {
                  print("Wrong"),
                  _getNextQuestion(),
                },
              ),
              Container(
                child: Text('Score: $_score',
                  style: TextStyle(
                    fontSize: 25,
                ),
                ),
              ),
            ] else ...[
              Text(
                "You scored $_score",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              RoundedButton(
                  title: "Try Quiz Again!",
                  color: Colors.blueAccent,
                  onPressed: () {
                    _reset();
                  }
              ),
            ]
          ],
        ),
      ),
    );
  }
}
