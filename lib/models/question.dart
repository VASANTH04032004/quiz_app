import 'answer.dart';

class Question {
  final String question;
  final List<Answer> answers;
  final Answer correctAnswer;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
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
      Question(
        question: 'What is the capital of France?',
        answers: [
          Answer.correct('Paris'),
          Answer.incorrect('London'),
          Answer.incorrect('Rome'),
          Answer.incorrect('Berlin'),
        ],
        correctAnswer: Answer.correct('Paris'),
      ),
      Question(
        question: 'Who wrote "To Kill a Mockingbird"?',
        answers: [
          Answer.correct('Harper Lee'),
          Answer.incorrect('J.K. Rowling'),
          Answer.incorrect('Ernest Hemingway'),
          Answer.incorrect('Mark Twain'),
        ],
        correctAnswer: Answer.correct('Harper Lee'),
      ),
      Question(
        question: 'What is the largest planet in our solar system?',
        answers: [
          Answer.incorrect('Earth'),
          Answer.incorrect('Mars'),
          Answer.correct('Jupiter'),
          Answer.incorrect('Saturn'),
        ],
        correctAnswer: Answer.correct('Jupiter'),
      ),
      Question(
        question: 'What is the chemical symbol for gold?',
        answers: [
          Answer.correct('Au'),
          Answer.incorrect('Ag'),
          Answer.incorrect('Pb'),
          Answer.incorrect('Fe'),
        ],
        correctAnswer: Answer.correct('Au'),
      ),
      Question(
        question: 'Who painted the Mona Lisa?',
        answers: [
          Answer.correct('Leonardo da Vinci'),
          Answer.incorrect('Vincent van Gogh'),
          Answer.incorrect('Pablo Picasso'),
          Answer.incorrect('Claude Monet'),
        ],
        correctAnswer: Answer.correct('Leonardo da Vinci'),
      ),
      Question(
        question: 'What is the smallest continent by land area?',
        answers: [
          Answer.correct('Australia'),
          Answer.incorrect('Europe'),
          Answer.incorrect('South America'),
          Answer.incorrect('Africa'),
        ],
        correctAnswer: Answer.correct('Australia'),
      ),
      Question(
        question: 'What is the main ingredient in guacamole?',
        answers: [
          Answer.correct('Avocado'),
          Answer.incorrect('Tomato'),
          Answer.incorrect('Pepper'),
          Answer.incorrect('Onion'),
        ],
        correctAnswer: Answer.correct('Avocado'),
      ),
      Question(
        question: 'What year did the Titanic sink?',
        answers: [
          Answer.correct('1912'),
          Answer.incorrect('1905'),
          Answer.incorrect('1898'),
          Answer.incorrect('1923'),
        ],
        correctAnswer: Answer.correct('1912'),
      ),
      Question(
        question: 'Which element has the atomic number 1?',
        answers: [
          Answer.correct('Hydrogen'),
          Answer.incorrect('Helium'),
          Answer.incorrect('Oxygen'),
          Answer.incorrect('Carbon'),
        ],
        correctAnswer: Answer.correct('Hydrogen'),
      ),
      Question(
        question: 'What is the longest river in the world?',
        answers: [
          Answer.correct('Nile'),
          Answer.incorrect('Amazon'),
          Answer.incorrect('Yangtze'),
          Answer.incorrect('Mississippi'),
        ],
        correctAnswer: Answer.correct('Nile'),
      ),
    ],
  ),
  QuizCategory(
    name: 'Science',
    questions: [
      Question(
        question: 'What planet is known as the Red Planet?',
        answers: [
          Answer.correct('Mars'),
          Answer.incorrect('Venus'),
          Answer.incorrect('Earth'),
          Answer.incorrect('Jupiter'),
        ],
        correctAnswer: Answer.correct('Mars'),
      ),
      Question(
        question: 'What is the chemical symbol for water?',
        answers: [
          Answer.correct('H2O'),
          Answer.incorrect('O2'),
          Answer.incorrect('CO2'),
          Answer.incorrect('H2SO4'),
        ],
        correctAnswer: Answer.correct('H2O'),
      ),
      Question(
        question: 'What is the process by which plants make their food?',
        answers: [
          Answer.correct('Photosynthesis'),
          Answer.incorrect('Respiration'),
          Answer.incorrect('Digestion'),
          Answer.incorrect('Transpiration'),
        ],
        correctAnswer: Answer.correct('Photosynthesis'),
      ),
      Question(
        question: 'Who is known as the father of modern physics?',
        answers: [
          Answer.correct('Albert Einstein'),
          Answer.incorrect('Isaac Newton'),
          Answer.incorrect('Niels Bohr'),
          Answer.incorrect('Galileo Galilei'),
        ],
        correctAnswer: Answer.correct('Albert Einstein'),
      ),
      Question(
        question: 'What gas do plants absorb from the atmosphere?',
        answers: [
          Answer.correct('Carbon Dioxide'),
          Answer.incorrect('Oxygen'),
          Answer.incorrect('Nitrogen'),
          Answer.incorrect('Hydrogen'),
        ],
        correctAnswer: Answer.correct('Carbon Dioxide'),
      ),
      Question(
        question: 'What is the most abundant gas in Earth’s atmosphere?',
        answers: [
          Answer.correct('Nitrogen'),
          Answer.incorrect('Oxygen'),
          Answer.incorrect('Carbon Dioxide'),
          Answer.incorrect('Argon'),
        ],
        correctAnswer: Answer.correct('Nitrogen'),
      ),
      Question(
        question: 'What is the powerhouse of the cell?',
        answers: [
          Answer.correct('Mitochondria'),
          Answer.incorrect('Nucleus'),
          Answer.incorrect('Ribosome'),
          Answer.incorrect('Endoplasmic Reticulum'),
        ],
        correctAnswer: Answer.correct('Mitochondria'),
      ),
      Question(
        question: 'What type of bond holds the two strands of DNA together?',
        answers: [
          Answer.correct('Hydrogen Bond'),
          Answer.incorrect('Ionic Bond'),
          Answer.incorrect('Covalent Bond'),
          Answer.incorrect('Metallic Bond'),
        ],
        correctAnswer: Answer.correct('Hydrogen Bond'),
      ),
      Question(
        question: 'What is the speed of light?',
        answers: [
          Answer.correct('299,792 km/s'),
          Answer.incorrect('150,000 km/s'),
          Answer.incorrect('300,000 km/s'),
          Answer.incorrect('200,000 km/s'),
        ],
        correctAnswer: Answer.correct('299,792 km/s'),
      ),
      Question(
        question: 'What is the chemical symbol for sodium?',
        answers: [
          Answer.correct('Na'),
          Answer.incorrect('N'),
          Answer.incorrect('S'),
          Answer.incorrect('So'),
        ],
        correctAnswer: Answer.correct('Na'),
      ),
    ],
  ),
  QuizCategory(
    name: 'History',
    questions: [
      Question(
        question: 'Who was the first President of the United States?',
        answers: [
          Answer.incorrect('Thomas Jefferson'),
          Answer.incorrect('Abraham Lincoln'),
          Answer.correct('George Washington'),
          Answer.incorrect('John Adams'),
        ],
        correctAnswer: Answer.correct('George Washington'),
      ),
      Question(
        question: 'In which year did World War II end?',
        answers: [
          Answer.correct('1945'),
          Answer.incorrect('1939'),
          Answer.incorrect('1944'),
          Answer.incorrect('1941'),
        ],
        correctAnswer: Answer.correct('1945'),
      ),
      Question(
        question: 'Who was the first man to walk on the Moon?',
        answers: [
          Answer.incorrect('Buzz Aldrin'),
          Answer.correct('Neil Armstrong'),
          Answer.incorrect('Yuri Gagarin'),
          Answer.incorrect('Michael Collins'),
        ],
        correctAnswer: Answer.correct('Neil Armstrong'),
      ),
      Question(
        question: 'What empire was ruled by Julius Caesar?',
        answers: [
          Answer.incorrect('Ottoman Empire'),
          Answer.incorrect('British Empire'),
          Answer.incorrect('Mongol Empire'),
          Answer.correct('Roman Empire'),
        ],
        correctAnswer: Answer.correct('Roman Empire'),
      ),
      Question(
        question: 'What ancient civilization built the pyramids?',
        answers: [
          Answer.incorrect('Romans'),
          Answer.incorrect('Greeks'),
          Answer.correct('Egyptians'),
          Answer.incorrect('Mesoamericans'),
        ],
        correctAnswer: Answer.correct('Egyptians'),
      ),
      Question(
        question: 'Who was the first female Prime Minister of the United Kingdom?',
        answers: [
          Answer.incorrect('Theresa May'),
          Answer.incorrect('Priti Patel'),
          Answer.incorrect('Nicola Sturgeon'),
          Answer.correct('Margaret Thatcher'),
        ],
        correctAnswer: Answer.correct('Margaret Thatcher'),
      ),
      Question(
        question: 'Which war was fought between the North and South in the United States?',
        answers: [
          Answer.incorrect('Revolutionary War'),
          Answer.correct('Civil War'),
          Answer.incorrect('World War I'),
          Answer.incorrect('World War II'),
        ],
        correctAnswer: Answer.correct('Civil War'),
      ),
      Question(
        question: 'Who discovered America in 1492?',
        answers: [
          Answer.correct('Christopher Columbus'),
          Answer.incorrect('Leif Erikson'),
          Answer.incorrect('Ferdinand Magellan'),
          Answer.incorrect('James Cook'),
        ],
        correctAnswer: Answer.correct('Christopher Columbus'),
      ),
      Question(
        question: 'Which country was the first to grant women the right to vote?',
        answers: [
          Answer.correct('New Zealand'),
          Answer.incorrect('United States'),
          Answer.incorrect('United Kingdom'),
          Answer.incorrect('Australia'),
        ],
        correctAnswer: Answer.correct('New Zealand'),
      ),
      Question(
        question: 'Who was the first person to circumnavigate the globe?',
        answers: [
          Answer.correct('Ferdinand Magellan'),
          Answer.incorrect('Christopher Columbus'),
          Answer.incorrect('Marco Polo'),
          Answer.incorrect('Vasco da Gama'),
        ],
        correctAnswer: Answer.correct('Ferdinand Magellan'),
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
