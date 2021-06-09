import 'package:cc_quiz_app/models/question.dart';

// final question1 = Question('',
//     [],
//     {
//     'a': '',
//     'b': '',
//     'c': '',
//     'd': '',
//     'e': ''
//     }
// );

final question1 = Question('What are the naming conventions in Python for variables, methods and function names ?',
['a'],
    {
      'a': 'Snake case (snake_case)',
      'b': 'Camel case (camelCase)',
      'c': 'Pascal case (PascalCase)'
    }
);
final question2 = Question('In Python what is the difference between is and == ?',
    ['b'],
    {
      'a': 'Nothing, they both do the same thing',
      'b': 'is defines if both the variables point to the same object in memory, whereas the == sign checks if the values for the two variables are the same',
      'c': '== operator defines if both the variables point to the same object whereas the is sign checks if the values for the two variables are the same'
    }
);
final question3 = Question('What do we mean by conditional logic ?',
    ['b'],
    {
      'a': 'Code that sorts an array into alphabetical or numerical order',
      'b': 'Checking if a condition is true or false before running a section of code',
      'c': 'When our project is dependent on other libraries to allow it to work'
    }
);
final question4 = Question('How do we check equality ?',
    ['a'],
    {
      'a': '==',
      'b': '=',
      'c': '&&',
      'd': '||'
    }
);

final question5 = Question('What does the ‘and’ logical operator do ?',
    ['b'],
    {
      'a': 'It returns ‘True’ if at least one condition evaluates to ‘True’',
      'b': 'It returns ‘True’ only if both conditions evaluate to ‘True’',
      'c': 'It returns ‘True’ only if both conditions evaluate to ‘False’',
    }
);

final question6 = Question('What does the ‘or’ logical operator do ?',
    ['a'],
    {
      'a': 'It returns ‘True’ if at least one condition evaluates to ‘True’',
      'b': 'It returns ‘True’ only if both conditions evaluate to ‘True’',
      'c': 'It returns ‘True’ only if both conditions evaluate to ‘False’',
    }
);

final question7 = Question('What is a package manager ?',
    ['a'],
    {
      'a': 'A piece of software that lets us install, update, or uninstall other pieces of software',
      'b': 'A piece of software that only lets us install or update pieces of software, you cannot use it to uninstall',
      'c': 'A piece of software that only lets us install or uninstall pieces of software, it cannot be used to update software',
      'd': 'A piece of software that only lets us update or uninstall pieces of software, it cannot be used to install software',
    }
);

final question8 = Question('Which package manager did we use with Python? ',
    ['c'],
    {
      'a': 'gems',
      'b': 'seed',
      'c': 'pip',
      'd': 'brew',
    }
);

final question19 = Question('How do you install a Python package using the package manager ?',
    ['b'],
    {
      'a': 'pip install',
      'b': 'pip3 install',
      'c': 'python install',
      'd': 'python3 install',
    }
);
final question10 = Question('How do you use an installed package in your code ?',
    ['a'],
    {
      'a': 'By using an ‘import’ statement e.g. ‘import pygame’',
      'b': 'By using a ‘require’ statement e.g. ‘require pygame’',
      'c': 'By using an ‘insert’ statement e.g. ‘insert pygame’',
      'd': 'By using a ‘download’ statement e.g. ‘download pygame’',
    }
);

List<Question> basicQuestions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10];


