import 'package:flutter/material.dart';
import 'dart:math';
import 'Result.dart';
void main() {
  runApp(
    MaterialApp(home: QuizApp(),),);
}
class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}
class _QuizAppState extends State<QuizApp> {
  List<Question> _questions = [
    Question(
      question: 'What is the biggest city in lebanon?',
      choices: [ 'Sour', 'Nabatiye','Beirut', 'Jbel?'],
      correctAnswer: 'Sour',
    ),
    Question(
      question: 'How much will the doc give me on this project?',
      choices: ['100', '92', '80','50'],
      correctAnswer: '100',
    ),
    Question(
      question: 'What is the capital of Lebanon?',
      choices: ['Beirut', 'Baabda', 'Jbel', 'none'],
      correctAnswer: 'Beirut',
    ),
    Question(
      question: 'Who invented electricity"?',
      choices: [ 'Hasan Kamel Al Sabah','William Shakespeare', 'John Martson', 'none of the above'],
      correctAnswer: 'Hasan Kamel Al Sabah',
    ),
    Question(
      question: 'What is the largest ocean on Earth?',
      choices: ['Pacific Ocean', 'Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean'],
      correctAnswer: 'Pacific Ocean',
    ),
    Question(
      question: 'What is lebanon rich in?',
      choices: [ 'Water', 'Weather','Thiefs', 'all of the above'],
      correctAnswer: 'all of the above',
    ),
    Question(
      question: 'Is the LIU the best UNI in Lebanon?',
      choices: ['Yes', 'First Answer', 'Second Answer', 'all of the above'],
      correctAnswer: 'all of the above',
    ),
    Question(
      question: 'Fastest Car in the World?',
      choices: ['BMW M5', 'Range Rover Sportage', 'Toyota Supra mk4', 'Honda CR-V'],
      correctAnswer: 'Toyota Supra mk4',
    ),
    Question(
      question: 'What is the currency of Lebanon?',
      choices: [ 'LBP', 'Dollar', 'Euro','Gold',],
      correctAnswer: 'LBP',
    ),
    Question(
      question: 'Who invented the telephone?',
      choices: ['Alexander Graham Bell', 'Thomas Edison', 'Nikola Tesla', 'Galileo Galilei'],
      correctAnswer: 'Alexander Graham Bell',
    ),
  ];
  int _currentQuestionIndex = 0;
  int _grade = 0;
  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex].correctAnswer) {
      setState(() {
        _grade += 10;
      });
    }
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultPage(grade: _grade),),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title:Text('The mighty test'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.greenAccent, Colors.green],),),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text(_questions[_currentQuestionIndex].question,
                  style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: _questions[_currentQuestionIndex].choices.map((choice) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () => _checkAnswer(choice),
                      child: Container(
                        width: 300,
                        height: 50,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            choice,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 8,
                        padding: EdgeInsets.fromLTRB(10,0,10,0), // Remove button padding
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
