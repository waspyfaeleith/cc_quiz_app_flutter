class Question {
  String questionText = '';
  List<int> correctAnswerIndices = [];
  List<String> answers = [];

  Question(String questionText, List<int> correctAnswerIndices, List<String> answers) {
    this.questionText = questionText;
    this.answers = answers;
    this.correctAnswerIndices = correctAnswerIndices;
  }
}