import 'package:flutter/material.dart';

import './clothes_questions.dart';
import './question_choice.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void iWasTapped() => print('I was tapped');
  var questions = [
    {
      "question": "What clothing type is your favorite?",
      "answers": [
        "Jackets and coats",
        "Suits",
        "Skirts and dresses",
      ],
    },
    {
      "question": "What is your size?",
      "answers": [
        "XS",
        "S",
        "M",
        "L",
        "XL",
      ],
    },
    {
      "question": "What color do you want?",
      "answers": [
        "Black",
        "Blue",
        "Green",
        "White",
      ]
    }
  ];
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      if (_questionIndex < questions.length - 1) {
        _questionIndex += 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clothes",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Time for shopping!"),
        ),
        body: Column(
          children: [
            ClothesQuestion(questions[_questionIndex]['question'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return QuestionChoice(
                _answerQuestion,
                answer,
              );
            })
          ],
        ),
      ),
    );
  }
}
