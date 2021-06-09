import 'package:cc_quiz_app/models/question.dart';
import 'package:test/test.dart';

void main() {
  final question = Question('Which is the best programming language?', ['b'], {'a': 'C++', 'b': 'C', 'c': 'Java', 'd': 'Python', 'e': 'JavaScript'});

  test('Question should have some question text', () {
   expect(question.questionText, 'Which is the best programming language?');
  });

  test('Question should have some answers', () {
    expect(question.answers.length, 5);
  });

  test('Question should have one correct answer', () {
    expect(question.correctAnswerKeys.length, 1);
    expect(question.correctAnswerKeys, ['b']);
  });

  test('Question should be able to have multiple correct answers', () {
    Question question2 = Question("Who are characters in `Still Game`?", ['b', 'd'], {'a': 'Rab C. Nesbitt', 'b': 'Jack Jarvis', 'c': 'Ella Cotter', 'd': 'Victor McDade'});
    expect(question2.correctAnswerKeys.length, 2);
    expect(question2.correctAnswerKeys, ['b', 'd']);
  });

}