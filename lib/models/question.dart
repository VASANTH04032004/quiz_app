enum AnswerType {
  radioButton,
  checkbox,
  switchButton,
}

class Question {
  final String question;
  final List<String> answers;
  final String correctAnswer;
  final AnswerType answerType;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.answerType,
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
        answers: ['Paris', 'London', 'Rome', 'Berlin'],
        correctAnswer: 'Paris',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'Who wrote "To Kill a Mockingbird"?',
        answers: ['Harper Lee', 'J.K. Rowling', 'Ernest Hemingway', 'Mark Twain'],
        correctAnswer: 'Harper Lee',
        answerType: AnswerType.checkbox,
      ),
      Question(
        question: 'What is the largest planet in our solar system?',
        answers: ['Earth', 'Mars', 'Jupiter', 'Saturn'],
        correctAnswer: 'Jupiter',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What is the chemical symbol for gold?',
        answers: ['Au', 'Ag', 'Pb', 'Fe'],
        correctAnswer: 'Au',
        answerType: AnswerType.switchButton,
      ),
      Question(
        question: 'Who painted the Mona Lisa?',
        answers: ['Leonardo da Vinci', 'Vincent van Gogh', 'Pablo Picasso', 'Claude Monet'],
        correctAnswer: 'Leonardo da Vinci',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What is the smallest continent by land area?',
        answers: ['Australia', 'Europe', 'South America', 'Africa'],
        correctAnswer: 'Australia',
        answerType: AnswerType.checkbox,
      ),
      Question(
        question: 'What is the main ingredient in guacamole?',
        answers: ['Avocado', 'Tomato', 'Pepper', 'Onion'],
        correctAnswer: 'Avocado',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What year did the Titanic sink?',
        answers: ['1912', '1905', '1898', '1923'],
        correctAnswer: '1912',
        answerType: AnswerType.switchButton,
      ),
      Question(
        question: 'Which element has the atomic number 1?',
        answers: ['Hydrogen', 'Helium', 'Oxygen', 'Carbon'],
        correctAnswer: 'Hydrogen',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What is the longest river in the world?',
        answers: ['Nile', 'Amazon', 'Yangtze', 'Mississippi'],
        correctAnswer: 'Nile',
        answerType: AnswerType.checkbox,
      ),
    ],
  ),

  QuizCategory(
    name: 'Science',
    questions: [
      Question(
        question: 'What planet is known as the Red Planet?',
        answers: ['Mars', 'Venus', 'Earth', 'Jupiter'],
        correctAnswer: 'Mars',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What is the chemical symbol for water?',
        answers: ['H2O', 'O2', 'CO2', 'H2SO4'],
        correctAnswer: 'H2O',
        answerType: AnswerType.switchButton,
      ),
      Question(
        question: 'What is the process by which plants make their food?',
        answers: ['Photosynthesis', 'Respiration', 'Digestion', 'Transpiration'],
        correctAnswer: 'Photosynthesis',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'Who is known as the father of modern physics?',
        answers: ['Albert Einstein', 'Isaac Newton', 'Niels Bohr', 'Galileo Galilei'],
        correctAnswer: 'Albert Einstein',
        answerType: AnswerType.checkbox,
      ),
      Question(
        question: 'What gas do plants absorb from the atmosphere?',
        answers: ['Carbon Dioxide', 'Oxygen', 'Nitrogen', 'Hydrogen'],
        correctAnswer: 'Carbon Dioxide',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What is the most abundant gas in Earth’s atmosphere?',
        answers: ['Nitrogen', 'Oxygen', 'Carbon Dioxide', 'Argon'],
        correctAnswer: 'Nitrogen',
        answerType: AnswerType.switchButton,
      ),
      Question(
        question: 'What is the powerhouse of the cell?',
        answers: ['Mitochondria', 'Nucleus', 'Ribosome', 'Endoplasmic Reticulum'],
        correctAnswer: 'Mitochondria',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What type of bond holds the two strands of DNA together?',
        answers: ['Hydrogen Bond', 'Ionic Bond', 'Covalent Bond', 'Metallic Bond'],
        correctAnswer: 'Hydrogen Bond',
        answerType: AnswerType.checkbox,
      ),
      Question(
        question: 'What is the speed of light?',
        answers: ['299,792 km/s', '150,000 km/s', '300,000 km/s', '200,000 km/s'],
        correctAnswer: '299,792 km/s',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What is the chemical symbol for sodium?',
        answers: ['Na', 'N', 'S', 'So'],
        correctAnswer: 'Na',
        answerType: AnswerType.radioButton,
      ),
    ],
  ),

  QuizCategory(
    name: 'History',
    questions: [
      Question(
        question: 'Who was the first President of the United States?',
        answers: ['Thomas Jefferson', 'Abraham Lincoln', 'George Washington', 'John Adams'],
        correctAnswer: 'George Washington',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'In which year did World War II end?',
        answers: ['1945', '1939', '1944', '1941'],
        correctAnswer: '1945',
        answerType: AnswerType.switchButton,
      ),
      Question(
        question: 'Who was the first man to walk on the Moon?',
        answers: ['Buzz Aldrin', 'Neil Armstrong', 'Yuri Gagarin', 'Michael Collins'],
        correctAnswer: 'Neil Armstrong',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What empire was ruled by Julius Caesar?',
        answers: ['Ottoman Empire', 'British Empire', 'Mongol Empire', 'Roman Empire'],
        correctAnswer: 'Roman Empire',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What ancient civilization built the pyramids?',
        answers: ['Romans', 'Greeks', 'Egyptians', 'Mesoamericans'],
        correctAnswer: 'Egyptians',
        answerType: AnswerType.checkbox,
      ),
      Question(
        question: 'Who was the first female Prime Minister of the United Kingdom?',
        answers: ['Theresa May', 'Priti Patel', 'Nicola Sturgeon', 'Margaret Thatcher'],
        correctAnswer: 'Margaret Thatcher',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'Which war was fought between the North and South in the United States?',
        answers: ['Revolutionary War', 'Civil War', 'World War I', 'World War II'],
        correctAnswer: 'Civil War',
        answerType: AnswerType.switchButton,
      ),
      Question(
        question: 'Who discovered America in 1492?',
        answers: ['Ferdinand Magellan', 'Vasco da Gama', 'Christopher Columbus', 'Hernán Cortés'],
        correctAnswer: 'Christopher Columbus',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'Which historical figure is known for his “I Have a Dream” speech?',
        answers: ['Malcolm X', 'Martin Luther King Jr.', 'Rosa Parks', 'Nelson Mandela'],
        correctAnswer: 'Martin Luther King Jr.',
        answerType: AnswerType.radioButton,
      ),
      Question(
        question: 'What was the name of the ship that carried the Pilgrims to America?',
        answers: ['Nina', 'Pinta', 'Santa Maria', 'Mayflower'],
        correctAnswer: 'Mayflower',
        answerType: AnswerType.radioButton,
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
