import 'package:flutter/material.dart';
import 'package:quiz_view/quiz_view.dart';

void main() {
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
            QuizView(
              // image: Container(
              //   width: 150,
              //   height: 150,
              //   child: Image.network(
              //       "https://yt3.ggpht.com/a/AATXAJyPMywRmD62sfK-1CXjwF0YkvrvnmaaHzs4uw=s900-c-k-c0xffffffff-no-rj-mo"),
              // ),
              showCorrect: true,
              tagBackgroundColor: Colors.blue,
              tagColor: Colors.black,
              questionTag: "Question: 1",
              answerColor: Colors.white,
              answerBackgroundColor: Color.fromARGB(255, 255, 0, 111),
              questionColor: Colors.white,
              backgroundColor: Colors.blue,//Color.fromARGB(255, 111, 0, 255),
              width: 300,
              height: 600,
              question: "Which is the best programming language?",
              rightAnswer: "C",
              wrongAnswers: ["C++", "Java", "Python", "JavaScript"],
              onRightAnswer: () => {
                print("Right"),
                setState(() { _score++; })
              },
              onWrongAnswer: () => print("Wrong"),
            ),
            Container(
              child: Text('Score: $_score'),
            ),

          ],
        ),
      ),
    );
  }
}
