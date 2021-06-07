import 'package:cc_quiz_app/models/question.dart';

class QuestionList{
  int _questionNumber = 0;

  String moduleName = '';
  List<Question> _questions = [];

  QuestionList(String moduleName) {
    this.moduleName = moduleName;
  }

  addQuestion(Question question) {
    this._questions.add(question);
  }

  int numberOfQuestions() {
    return this._questions.length;
  }

  int currentQuestionNumber() {
    return this._questionNumber;
  }

  void nextQuestion() {
    if (this._questionNumber < this._questions.length - 1) {
      this._questionNumber++;
    }
  }

  Question getQuestion() {
    return this._questions[this._questionNumber];
  }

  bool isFinished() {
    if (this._questionNumber >= this._questions.length - 1) {
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    this._questionNumber = 0;
  }
}