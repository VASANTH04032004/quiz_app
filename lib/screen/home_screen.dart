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
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Welcome, $userName!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.
                bold,color: Colors.black54),
              ),
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
    return Container(
      width: 400,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        color: Colors.greenAccent,
        child: Center(
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizScreen(category: title)),
            );
          },
        ),
        ),
      ),
    );
  }
}
