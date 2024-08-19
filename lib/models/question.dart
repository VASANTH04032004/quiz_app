import 'answer.dart';

class Question {
  final String question;
  final List<Answer> answers;
  final List<Answer> correctAnswers;
  final bool isIndexBased;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswers,
    required this.isIndexBased,
  });
}


class QuizCategory {
  final String name;
  final List<Question> questions;

  QuizCategory({
    required this.name,
    required this.questions,
  });
}

List<QuizCategory> quizCategories = [
  QuizCategory(
    name: 'General Knowledge',
    questions: [
      // Radio button type
      Question(
        question: 'What is the capital of France?',
        answers: [
          Answer.correct('Paris'),
          Answer.incorrect('London'),
          Answer.incorrect('Rome'),
          Answer.incorrect('Berlin'),
        ],
        correctAnswers: [Answer.correct('Paris')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'Who wrote "To Kill a Mockingbird"?',
        answers: [
          Answer.correct('Harper Lee'),
          Answer.incorrect('J.K. Rowling'),
          Answer.incorrect('Ernest Hemingway'),
          Answer.incorrect('Mark Twain'),
        ],
        correctAnswers: [Answer.correct('Harper Lee')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'What is the largest planet in our solar system?',
        answers: [
          Answer.incorrect('Earth'),
          Answer.incorrect('Mars'),
          Answer.correct('Jupiter'),
          Answer.incorrect('Saturn'),
        ],
        correctAnswers: [Answer.correct('Jupiter')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'What is the chemical symbol for gold?',
        answers: [
          Answer.correct('Au'),
          Answer.incorrect('Ag'),
          Answer.incorrect('Pb'),
          Answer.incorrect('Fe'),
        ],
        correctAnswers: [Answer.correct('Au')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'Who painted the Mona Lisa?',
        answers: [
          Answer.correct('Leonardo da Vinci'),
          Answer.incorrect('Vincent van Gogh'),
          Answer.incorrect('Pablo Picasso'),
          Answer.incorrect('Claude Monet'),
        ],
        correctAnswers: [Answer.correct('Leonardo da Vinci')],
        isIndexBased: false, // Radio button type
      ),
      // Index button type
      Question(
        question: 'What are some types of fruit?',
        answers: [
          Answer.correct('Apple'),
          Answer.correct('Banana'),
          Answer.incorrect('Carrot'),
          Answer.incorrect('Potato'),
        ],
        correctAnswers: [Answer.correct('Apple'), Answer.correct('Banana')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Which of these are programming languages?',
        answers: [
          Answer.correct('Dart'),
          Answer.correct('Python'),
          Answer.incorrect('HTML'),
          Answer.incorrect('CSS'),
        ],
        correctAnswers: [Answer.correct('Dart'), Answer.correct('Python')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Select some prime numbers:',
        answers: [
          Answer.correct('2'),
          Answer.correct('3'),
          Answer.incorrect('4'),
          Answer.incorrect('6'),
        ],
        correctAnswers: [Answer.correct('2'), Answer.correct('3')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Which of these are planets?',
        answers: [
          Answer.correct('Mars'),
          Answer.correct('Saturn'),
          Answer.incorrect('Sun'),
          Answer.incorrect('Moon'),
        ],
        correctAnswers: [Answer.correct('Mars'), Answer.correct('Saturn')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Which elements are gases at room temperature?',
        answers: [
          Answer.correct('Oxygen'),
          Answer.correct('Nitrogen'),
          Answer.incorrect('Iron'),
          Answer.incorrect('Copper'),
        ],
        correctAnswers: [Answer.correct('Oxygen'), Answer.correct('Nitrogen')],
        isIndexBased: true, // Index button type
      ),
    ],
  ),
  QuizCategory(
    name: 'Science',
    questions: [
      // Radio button type
      Question(
        question: 'What planet is known as the Red Planet?',
        answers: [
          Answer.correct('Mars'),
          Answer.incorrect('Venus'),
          Answer.incorrect('Earth'),
          Answer.incorrect('Jupiter'),
        ],
        correctAnswers: [Answer.correct('Mars')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'What is the chemical symbol for water?',
        answers: [
          Answer.correct('H2O'),
          Answer.incorrect('O2'),
          Answer.incorrect('CO2'),
          Answer.incorrect('H2SO4'),
        ],
        correctAnswers: [Answer.correct('H2O')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'What is the process by which plants make their food?',
        answers: [
          Answer.correct('Photosynthesis'),
          Answer.incorrect('Respiration'),
          Answer.incorrect('Digestion'),
          Answer.incorrect('Transpiration'),
        ],
        correctAnswers: [Answer.correct('Photosynthesis')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'Who is known as the father of modern physics?',
        answers: [
          Answer.correct('Albert Einstein'),
          Answer.incorrect('Isaac Newton'),
          Answer.incorrect('Niels Bohr'),
          Answer.incorrect('Galileo Galilei'),
        ],
        correctAnswers: [Answer.correct('Albert Einstein')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'What gas do plants absorb from the atmosphere?',
        answers: [
          Answer.correct('Carbon Dioxide'),
          Answer.incorrect('Oxygen'),
          Answer.incorrect('Nitrogen'),
          Answer.incorrect('Hydrogen'),
        ],
        correctAnswers: [Answer.correct('Carbon Dioxide')],
        isIndexBased: false, // Radio button type
      ),
      // Index button type
      Question(
        question: 'Which of these are chemical elements?',
        answers: [
          Answer.correct('Gold'),
          Answer.correct('Silver'),
          Answer.incorrect('Water'),
          Answer.incorrect('Sugar'),
        ],
        correctAnswers: [Answer.correct('Gold'), Answer.correct('Silver')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Select the primary colors:',
        answers: [
          Answer.correct('Red'),
          Answer.correct('Blue'),
          Answer.incorrect('Green'),
          Answer.incorrect('Purple'),
        ],
        correctAnswers: [Answer.correct('Red'), Answer.correct('Blue')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Which of these are human senses?',
        answers: [
          Answer.correct('Sight'),
          Answer.correct('Hearing'),
          Answer.incorrect('Gravity'),
          Answer.incorrect('Velocity'),
        ],
        correctAnswers: [Answer.correct('Sight'), Answer.correct('Hearing')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Which animals are mammals?',
        answers: [
          Answer.correct('Elephant'),
          Answer.correct('Dolphin'),
          Answer.incorrect('Shark'),
          Answer.incorrect('Eagle'),
        ],
        correctAnswers: [Answer.correct('Elephant'), Answer.correct('Dolphin')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Select renewable energy sources:',
        answers: [
          Answer.correct('Solar'),
          Answer.correct('Wind'),
          Answer.incorrect('Coal'),
          Answer.incorrect('Natural Gas'),
        ],
        correctAnswers: [Answer.correct('Solar'), Answer.correct('Wind')],
        isIndexBased: true, // Index button type
      ),
    ],
  ),
  QuizCategory(
    name: 'History',
    questions: [
      // Radio button type
      Question(
        question: 'Who was the first President of the United States?',
        answers: [
          Answer.incorrect('Thomas Jefferson'),
          Answer.incorrect('Abraham Lincoln'),
          Answer.correct('George Washington'),
          Answer.incorrect('John Adams'),
        ],
        correctAnswers: [Answer.correct('George Washington')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'In which year did World War II end?',
        answers: [
          Answer.correct('1945'),
          Answer.incorrect('1939'),
          Answer.incorrect('1944'),
          Answer.incorrect('1941'),
        ],
        correctAnswers: [Answer.correct('1945')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'Who was the first man to walk on the Moon?',
        answers: [
          Answer.incorrect('Buzz Aldrin'),
          Answer.correct('Neil Armstrong'),
          Answer.incorrect('Yuri Gagarin'),
          Answer.incorrect('Michael Collins'),
        ],
        correctAnswers: [Answer.correct('Neil Armstrong')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'What empire was ruled by Julius Caesar?',
        answers: [
          Answer.incorrect('Ottoman Empire'),
          Answer.incorrect('British Empire'),
          Answer.incorrect('Mongol Empire'),
          Answer.correct('Roman Empire'),
        ],
        correctAnswers: [Answer.correct('Roman Empire')],
        isIndexBased: false, // Radio button type
      ),
      Question(
        question: 'What was the main focus of the Renaissance period?',
        answers: [
          Answer.correct('Art and Science'),
          Answer.incorrect('Industrialization'),
          Answer.incorrect('Exploration'),
          Answer.incorrect('Revolution'),
        ],
        correctAnswers: [Answer.correct('Art and Science')],
        isIndexBased: false, // Radio button type
      ),
      // Index button type
      Question(
        question: 'Which of these were ancient civilizations?',
        answers: [
          Answer.correct('Egyptians'),
          Answer.correct('Greeks'),
          Answer.incorrect('Mayans'),
          Answer.incorrect('Incas'),
        ],
        correctAnswers: [Answer.correct('Egyptians'), Answer.correct('Greeks')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Select some famous leaders of the 20th century:',
        answers: [
          Answer.correct('Winston Churchill'),
          Answer.correct('Nelson Mandela'),
          Answer.incorrect('Cleopatra'),
          Answer.incorrect('Alexander the Great'),
        ],
        correctAnswers: [Answer.correct('Winston Churchill'), Answer.correct('Nelson Mandela')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Which events occurred in the 19th century?',
        answers: [
          Answer.correct('American Civil War'),
          Answer.correct('Industrial Revolution'),
          Answer.incorrect('World War I'),
          Answer.incorrect('Fall of the Berlin Wall'),
        ],
        correctAnswers: [Answer.correct('American Civil War'), Answer.correct('Industrial Revolution')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Select significant battles of World War II:',
        answers: [
          Answer.correct('Battle of Stalingrad'),
          Answer.correct('Battle of Midway'),
          Answer.incorrect('Battle of Gettysburg'),
          Answer.incorrect('Battle of Waterloo'),
        ],
        correctAnswers: [Answer.correct('Battle of Stalingrad'), Answer.correct('Battle of Midway')],
        isIndexBased: true, // Index button type
      ),
      Question(
        question: 'Which countries were part of the Axis Powers?',
        answers: [
          Answer.correct('Germany'),
          Answer.correct('Japan'),
          Answer.incorrect('France'),
          Answer.incorrect('USA'),
        ],
        correctAnswers: [Answer.correct('Germany'), Answer.correct('Japan')],
        isIndexBased: true, // Index button type
      ),
    ],
  ),
];


QuizCategory getCategoryByName(String categoryName) {
  return quizCategories.firstWhere(
        (category) => category.name == categoryName,
    orElse: () => QuizCategory(
      name: 'Not Found',
      questions: [],
    ),
  );
}
