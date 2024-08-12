import 'package:flutter/material.dart';
import '../question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String category;

  QuizScreen({required this.category});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _selectedAnswer;

  late QuizCategory? _quizCategory;

  @override
  void initState() {
    super.initState();
    _quizCategory = getCategoryByName(widget.category);
  }

  void _nextQuestion() {
    if (_selectedAnswer == _quizCategory?.questions[_currentQuestionIndex].correctAnswer) {
      _score++;
    }

    if (_currentQuestionIndex < (_quizCategory?.questions.length ?? 0) - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: _score,
            total: _quizCategory?.questions.length ?? 0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_quizCategory == null || _quizCategory!.questions.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text('No questions available for this category.'),
        ),
      );
    }

    double progress = _currentQuestionIndex / _quizCategory!.questions.length;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: Colors.grey[300],
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      _quizCategory!.questions[_currentQuestionIndex].question,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    ..._quizCategory!.questions[_currentQuestionIndex].answers.map<Widget>((answer) {
                      return RadioListTile<String>(
                        title: Text(answer),
                        value: answer,
                        groupValue: _selectedAnswer,
                        onChanged: (value) {
                          setState(() {
                            _selectedAnswer = value;
                          });
                        },
                      );
                    }).toList(),
                    Spacer(),
                    ElevatedButton(
                      onPressed: _selectedAnswer != null ? _nextQuestion : null,
                      child: Text(_currentQuestionIndex < _quizCategory!.questions.length - 1
                          ? 'Next'
                          : 'Finish'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
