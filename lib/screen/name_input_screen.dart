import 'package:flutter/material.dart';
import 'home_screen.dart';

class UserNameScreen extends StatefulWidget {
  @override
  _UserNameScreenState createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _buttonScaleAnimation;
  bool _isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _buttonScaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _submitName() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        _isButtonPressed = true;
      });
      // Trigger the button press animation and navigate to the HomeScreen
      Future.delayed(Duration(milliseconds: 200), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(userName: _nameController.text),
          ),
        );
      });
      setState(() {
        _isButtonPressed = true;
      });

      Future.delayed(Duration(milliseconds: 200), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(userName: _nameController.text),
          ),
        );
      });
    }
  }

  void _unfocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocus,
      child: Scaffold(
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                      'Quiz',
                      style: TextStyle(
                        fontSize: 70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Enter your name:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Focus(
                          onFocusChange: (hasFocus) {
                            setState(() {
                            });
                          },
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey, // Default border color
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF098EAB), // Border color when focused
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ScaleTransition(
                    scale: _isButtonPressed ? _buttonScaleAnimation : AlwaysStoppedAnimation(1),
                    child: ElevatedButton(
                      onPressed: _submitName,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF098EAB),
                        minimumSize: Size(double.infinity, 50),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        textStyle: TextStyle(fontSize: 20),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
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
