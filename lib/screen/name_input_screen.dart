import 'package:flutter/material.dart';
import 'home_screen.dart';

class NameInputScreen extends StatefulWidget {
  @override
  _NameInputScreenState createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final TextEditingController _nameController = TextEditingController();

  void _submitName() {
    if (_nameController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(userName: _nameController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitName,
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
