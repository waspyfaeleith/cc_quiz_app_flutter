class Question {
  String questionText = "";
  String rightAnswer = "";
  List<String> wrongAnswers = [];

  Question(String questionText, String rightAnswer,List<String> wrongAnswers) {
    this.questionText = questionText;
    this.rightAnswer = rightAnswer;
    this.wrongAnswers = wrongAnswers;
  }
}