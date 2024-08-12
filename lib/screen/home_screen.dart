import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  HomeScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Categories'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, $userName!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  buildCategoryCard(context, 'General Knowledge'),
                  buildCategoryCard(context, 'Science'),
                  buildCategoryCard(context, 'History'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCard(BuildContext context, String title) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizScreen(category: title)),
          );
        },
      ),
    );
  }
}
