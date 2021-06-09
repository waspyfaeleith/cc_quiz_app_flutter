import 'package:cc_quiz_app/models/question.dart';
import 'package:test/test.dart';

void main() {
  final question = Question('Which is the best programming language?', [1], ['C++',  'C', 'Java', 'Python', 'JavaScript']);

  test('Question should have some question text', () {
   expect(question.questionText, 'Which is the best programming language?');
  });

  test('Question should have some answers', () {
    expect(question.answers.length, 5);
  });

  test('Question should have one correct answer', () {
    expect(question.correctAnswerIndices.length, 1);
  });

  test('Question should be able to have multiple correct answers', () {
    Question question2 = Question("Who are characters in `Still Game`?", [1, 3], ["Rab C. Nesbitt", "Jack Jarvis", "Ella Cotter", "Victor McDade"]);
    expect(question2.correctAnswerIndices.length, 2);
    expect(question2.correctAnswerIndices, [1,3]);
  });

}