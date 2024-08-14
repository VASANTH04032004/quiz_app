import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int total;
  final String userName;

  ResultScreen({required this.score, required this.total, required this.userName});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage
    int percentage = widget.total > 0 ? ((widget.score / widget.total) * 100).round() : 0;

    // Determine the circle's outline color based on the percentage
    Color outlineColor;
    if (percentage <= 40) {
      outlineColor = Colors.red;
    } else if (percentage <= 70) {
      outlineColor = Colors.orange;
    } else {
      outlineColor = Colors.green;
    }

    String resultText = percentage <= 50 ? 'Poor!' : 'Great!';
    Color resultColor = percentage <= 50 ? Colors.red : Colors.teal.shade800;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Hey, ${widget.userName}!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Column(
              children: [
                Spacer(flex: 1), // Pushes the circle to the middle
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: outlineColor,
                        width: 6.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${percentage}%',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 1), // Pushes the text below the circle
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: resultColor,
                    ),
                  ),
                ),
                Spacer(flex: 2), // Adjust space between circle and button
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0), // Equal padding on all sides for the button
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    _customPageTransition(
                      HomeScreen(userName: widget.userName),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF098EAB),
                  minimumSize: Size(double.infinity, 60),
                  textStyle: TextStyle(fontSize: 20),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text('Back to Home'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PageRouteBuilder _customPageTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.1);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        var scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(animation);

        return SlideTransition(
          position: offsetAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
