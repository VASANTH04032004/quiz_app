import 'package:flutter/material.dart';
import '../models/question.dart';
import '../models/answer.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final String userName;

  QuizScreen({required this.category, required this.userName});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  int _currentQuestionIndex = 0;
  int _score = 0;
  Answer? _selectedAnswer;
  late QuizCategory? _quizCategory;
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late double _progressValue;

  @override
  void initState() {
    super.initState();
    _quizCategory = getCategoryByName(widget.category);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _progressValue = 0;
    _progressAnimation = Tween<double>(begin: _progressValue, end: _progressValue).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  void _nextQuestion() {
    if (_selectedAnswer == _quizCategory?.questions[_currentQuestionIndex].correctAnswer) {
      _score++;
    }

    if (_currentQuestionIndex < (_quizCategory?.questions.length ?? 0) - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
        _progressValue = (_currentQuestionIndex + 1) / (_quizCategory?.questions.length ?? 1);
        _progressAnimation = Tween<double>(begin: _progressAnimation.value, end: _progressValue).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
        );
        _animationController.forward(from: 0);
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: _score,
            total: _quizCategory?.questions.length ?? 0,
            userName: widget.userName,
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
      appBar: AppBar(
        title: Text(widget.category),
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
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: LinearProgressIndicator(
                          value: _progressAnimation.value,
                          minHeight: 16,
                          backgroundColor: Colors.transparent,
                          color: Color(0xFF098EAB),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    },
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
                      FadeTransition(
                        opacity: _animationController.drive(
                          Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeInOut)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 54.0),
                          child: Text(
                            _quizCategory!.questions[_currentQuestionIndex].question,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView(
                          children: _quizCategory!.questions[_currentQuestionIndex].answers.map<Widget>((answer) {
                            bool isSelected = _selectedAnswer == answer;
                            return FadeTransition(
                              opacity: _animationController.drive(
                                Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeInOut)),
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected ? Colors.green : Color(0xFF098EAB),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: RadioListTile<Answer>(
                                  title: Text(answer.answerText, style: TextStyle(fontSize: 18, color: Colors.black)),
                                  value: answer,
                                  groupValue: _selectedAnswer,
                                  contentPadding: EdgeInsets.zero,
                                  activeColor: Color(0xFF098EAB),
                                  onChanged: (Answer? value) {
                                    setState(() {
                                      _selectedAnswer = value;
                                    });
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      ScaleTransition(
                        scale: _animationController.drive(
                          Tween<double>(begin: 0.9, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)),
                        ),
                        child: ElevatedButton(
                          onPressed: _selectedAnswer != null ? _nextQuestion : null,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 60),
                            backgroundColor: Color(0xFF098EAB),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            fixedSize: Size(double.infinity, 40),
                            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            _currentQuestionIndex < _quizCategory!.questions.length - 1
                                ? 'Next'
                                : 'Finish',
                          ),
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
