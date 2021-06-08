import 'package:cc_quiz_app/models/question.dart';

final question1 = Question('What do we mean by conditional logic?',
    'Checking if a condition is true or false before running a section of code',
    ['Code that sorts an array into alphabetical or numerical order',
      'When our project is dependent on other libraries to allow it to work']);

final question2 = Question('How do we check equality?', '==', ['=', '&&', '||']);
final question3 = Question('What do we use functions for?',
'To hold small chunks of code that can be invoked later on in our program',
['To hold lots of code that does many things which can be invoked later on in our program', 'To hold code we aren’t sure we want to use just yet']);
final question4 = Question('How many arguments can be passed into a function?', 'As many arguments that the function is expecting',
['One argument only', 'As many as we like']);
final question5 = Question('How many parameters can be set for a function?', 'As many as we need', ['One parameter only', 'A maximum of 10 parameters']);

List<Question> basicQuestions = [question1, question2, question3, question4, question5];


