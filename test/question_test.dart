import 'package:cc_quiz_app/models/question.dart';
import 'package:test/test.dart';

void main() {
  final question = Question('Which is the best programming language?', 'C', ['C++', 'Java', 'Python', 'JavaScript']);

  test('Question should have some question text', () {
   expect(question.questionText, 'Which is the best programming language?');
  });

  test('Question should have a rightAnswer', () {
    expect(question.rightAnswer, 'C');
  });

  test('Question should have some wrong answers', () {
    expect(question.wrongAnswers.length, 4);
  });

  test('first wrong answer should be C++', () {
    expect(question.wrongAnswers[0], 'C++');
  });

}