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
          builder: (context) => ResultScreen(score: _score, total: _quizCategory?.questions.length ?? 0),
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
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                child: Container(
                  width: 350,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 12,
                    backgroundColor: Colors.transparent, // Transparent background
                    color: Colors.redAccent,
                  ),
                ),
                )
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          _quizCategory!.questions[_currentQuestionIndex].question,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView(
                          children: _quizCategory!.questions[_currentQuestionIndex].answers.map<Widget>((answer) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: RadioListTile<String>(
                                title: Text(answer, style: TextStyle(fontSize: 18)),
                                value: answer,
                                groupValue: _selectedAnswer,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedAnswer = value;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _selectedAnswer != null ? _nextQuestion : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 60),
                          backgroundColor: Colors.greenAccent,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black26),
                        ),
                        child: Text(
                          _currentQuestionIndex < _quizCategory!.questions.length - 1
                              ? 'Next'
                              : 'Finish',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
