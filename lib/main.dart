import 'package:cc_quiz_app/components/rounded_button.dart';
import 'package:cc_quiz_app/models/question.dart';
import 'package:flutter/material.dart';
import 'package:cc_quiz_app/data/question_data.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_select_item/multi_select_item.dart';

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
  List optionsList = [];
  MultiSelectController controller = new MultiSelectController();

  @override
  void initState() {
    super.initState();
    _setUpOptions();
  }

  void _setUpOptions() {
    int optionNumber = 1;
    optionsList = [];
    _currentQuestion.wrongAnswers.shuffle();
    for (String answer in _currentQuestion.wrongAnswers){
      optionsList.add({"key": "$optionNumber", "value": answer});
      optionNumber++;
    }

    controller.disableEditingWhenNoneSelected = true;
    controller.set(optionsList.length);
  }

  void add() {
    optionsList.add({"key": optionsList.length + 1});

    setState(() {
      controller.set(optionsList.length);
    });
  }

  void delete() {
    var list = controller.selectedIndexes;
    list.sort((b, a) =>
        a.compareTo(b)); //reoder from biggest number, so it wont error
    list.forEach((element) {
      optionsList.removeAt(element);
    });

    setState(() {
      controller.set(optionsList.length);
    });
  }

  void selectAll() {
    setState(() {
      controller.toggleAll();
    });
  }

  void _getNextQuestion() {
    if (_questions.isFinished() == false) {
      _questions.nextQuestion();
      setState(() {
        _currentQuestion = _questions.getQuestion();
        _setUpOptions();
      });
    } else {
      setState(() {
        _quizComplete = true;
      });
    }
  }

  void _reset() {
    _questions.reset();
    _setUpOptions();
    setState(() {
      _currentQuestion = _questions.getQuestion();
      _score = 0;
      _quizComplete = false;
    });

  }

  void _incrementScore() {
    setState(() {
      _score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //block app from quitting when selecting
        var before = !controller.isSelecting;
        setState(() {
          controller.deselectAll();
        });
        return before;
      },
      child: Scaffold(
        appBar: AppBar(
          //title: Text(widget.title),
          title: Text('Selected ${controller.selectedIndexes.length}  ' +
              controller.selectedIndexes.toString()),
          actions: (controller.isSelecting)
          ? [
          IconButton(
            icon: Icon(Icons.select_all),
            onPressed: selectAll,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: delete,
          )
          ] : [],
        ),
        body: Center(
          child: Container(
            height: 600.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_quizComplete == false) ...[
                  Text("${_currentQuestion.questionText}"),
                  ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                itemCount: optionsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: MultiSelectItem(
                      isSelecting: controller.isSelecting,
                      onSelected: () {
                        setState(() {
                          controller.toggle(index);
                        });
                      },
                      child: Container(
                        child: ListTile(
                          title: new Text(" Title ${optionsList[index]['key']}"),
                          subtitle: new Text("Description ${optionsList[index]['value']}"),
                        ),
                        decoration: controller.isSelected(index)
                            ? new BoxDecoration(color: Colors.blue[300])
                            : new BoxDecoration(),
                      ),
                    ),
                  );
                },
              ),
                  RoundedButton(
                    title: "Submit Answer",
                    color: Colors.blueAccent,
                    onPressed: () {
                          _getNextQuestion();
                    },
                  ),
                ] else ...[
                  Text(
                    "You scored $_score out of ${_questions.numberOfQuestions()}",
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
                ],
            ],
            ),
          ),
        ),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       if (_quizComplete == false) ...[
        //         RoundedButton(
        //             title: "Submit Answer",
        //             color: Colors.blueAccent,
        //             onPressed: () {
        //               _getNextQuestion();
        //             }
        //         ),
        //         Container(
        //           child: Text('Score: $_score',
        //             style: TextStyle(
        //               fontSize: 25,
        //           ),
        //           ),
        //         ),
        //       ] else ...[
        //         Text(
        //           "You scored $_score out of ${_questions.numberOfQuestions()}",
        //           style: TextStyle(
        //             fontSize: 25,
        //           ),
        //         ),
        //         RoundedButton(
        //             title: "Try Quiz Again!",
        //             color: Colors.blueAccent,
        //             onPressed: () {
        //               _reset();
        //             }
        //         ),
        //       ]
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
