class Question {
  String questionText = '';
  List<String> correctAnswerKeys = [];
  var answers;

  Question(String questionText, List<String> correctAnswerKeys, var answers) {
    this.questionText = questionText;
    this.correctAnswerKeys = correctAnswerKeys;
    this.answers = answers;
  }
}