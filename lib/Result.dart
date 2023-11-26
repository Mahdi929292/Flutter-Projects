import 'package:flutter/material.dart';
import 'dart:math';
class Question {
  final String question;
  final List<String> choices;
  final String correctAnswer;
  Question({required this.question, required this.choices, required this.correctAnswer});
}
class ResultPage extends StatelessWidget {
  final int grade;
  ResultPage({required this.grade});
  @override
  Widget build(BuildContext context) {
    String resultText = '';
    if (grade == 100) {
      resultText = 'Perfect';
    } else if (grade >= 75 && grade <= 99) {
      resultText = 'Good';
    } else if (grade >= 50 && grade <= 74) {
      resultText = 'Not bad';
    } else {
      resultText = 'Weak';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.greenAccent, Colors.green],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Your Grade: $grade',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                          blurRadius:3,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 3)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  resultText,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2, 3),
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
