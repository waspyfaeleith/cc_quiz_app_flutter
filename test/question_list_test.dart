import 'package:cc_quiz_app/models/question.dart';
import 'package:cc_quiz_app/models/question_list.dart';
import 'package:test/test.dart';

void main() {

  final question1 = Question('Which is the best programming language?', 'C', ['C++', 'Java', 'Python', 'JavaScript']);
  final question2 = Question('Who won the F.A. Cup in 1958?', 'Bolton Wanderers', ['Mancheter United', 'Blackpool', 'Arsenal', 'Tottenham Hotspur']);

  QuestionList questionList = QuestionList("Misc");

  test('Question list should have a module name', () {
    expect(questionList.moduleName, 'Misc');
  });

  test('Question number should start at 0', () {
    expect(questionList.currentQuestionNumber(), 0);
  });

  test('Question list should start empty', () {
    expect(questionList.numberOfQuestions(), 0);
  });

  test('Can add question to list', () {
    questionList.addQuestion(question1);
    expect(questionList.numberOfQuestions(), 1);
  });

  test('Can get question from list', () {
    Question question = questionList.getQuestion();
    expect(question.questionText, 'Which is the best programming language?');
    expect(question.rightAnswer, 'C');
    expect(question.wrongAnswers, ['C++', 'Java', 'Python', 'JavaScript']);
  });

  test('Can get next question number', () {
    questionList.addQuestion(question2);
    questionList.nextQuestion();
    expect(questionList.currentQuestionNumber(), 1);
  });

  test('Can get next question', () {
    questionList.nextQuestion();
    Question question = questionList.getQuestion();

    expect(question, question2);
  });

  test('Quiz finished - false', () {
    questionList.addQuestion(question2);

    expect(questionList.isFinished(), false);
  });

  test('Quiz finished - true', () {
    questionList.nextQuestion();
    questionList.nextQuestion();

    expect(questionList.currentQuestionNumber(), 2);
    expect(questionList.isFinished(), true);
  });

  test('Quiz - can reset question number to zero', () {
    questionList.addQuestion(question1);
    questionList.addQuestion(question2);
    questionList.nextQuestion();
    questionList.reset();


    expect(questionList.currentQuestionNumber(), 0);
  });


}