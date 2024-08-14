import 'package:flutter/material.dart';
import '../models/question.dart';
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
  String? _selectedAnswer;
  late QuizCategory? _quizCategory;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _quizCategory = getCategoryByName(widget.category);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
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
        _animationController.reset();
        _animationController.forward();
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
        title: Text('Quiz'),
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
                        width: 380,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 16,  // Match the height of the container for consistency
                          backgroundColor: Colors.transparent,
                          color: Color(0xFF098EAB),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 54.0),
                          child: Text(
                            _quizCategory!.questions[_currentQuestionIndex].question,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: _quizCategory!.questions[_currentQuestionIndex].answers.map<Widget>((answer) {
                            bool isSelected = _selectedAnswer == answer;
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected ? Colors.green : Color(0xFF098EAB),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: RadioListTile<String>(
                                title: Text(answer, style: TextStyle(fontSize: 18, color: Colors.black)),
                                value: answer,
                                groupValue: _selectedAnswer,
                                contentPadding: EdgeInsets.zero,
                                activeColor: Color(0xFF098EAB),
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