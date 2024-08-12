class Question {
  final String question;
  final List<String> answers;
  final String correctAnswer;

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
        question: 'Question 1 for Category 1?',
        answers: ['A', 'B', 'C', 'D'],
        correctAnswer: 'A',
      ),
      Question(
        question: 'Question 2 for Category 1?',
        answers: ['A', 'B', 'C', 'D'],
        correctAnswer: 'B',
      ),

    ],
  ),
  QuizCategory(
    name: 'Science',
    questions: [
      Question(
        question: 'Question 1 for Category 2?',
        answers: ['A', 'B', 'C', 'D'],
        correctAnswer: 'C',
      ),
      Question(
        question: 'Question 2 for Category 2?',
        answers: ['A', 'B', 'C', 'D'],
        correctAnswer: 'D',
      ),
    ],
  ),

];

QuizCategory getCategoryByName(String categoryName) {
  return quizCategories.firstWhere(
        (category) => category.name == categoryName,
    orElse: () => QuizCategory(
      name: 'Not Found',
      questions: [], // Or provide an empty list
    ),
  );
}
