class Answer {
  final String answerText;
  final int points;

  Answer({
    required this.answerText,
    required this.points,
  });

  factory Answer.correct(String answerText) {
    return Answer(answerText: answerText, points: 10);
  }

  factory Answer.incorrect(String answerText) {
    return Answer(answerText: answerText, points: 0);
  }
  @override
  String toString() => answerText;
}
