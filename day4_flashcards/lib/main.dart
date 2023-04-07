import 'package:day4_flashcards/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import "package:day4_flashcards/falshcard_view.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<FlashCard> _flashcards = [
    (FlashCard(
        question: "What's the greatest movie ever made?",
        answer: "Shanwshank Redemption")),
    (FlashCard(
        question: "Who's the greatest actor ever lived?", answer: "Tom Hanks")),
    (FlashCard(
        question: "Who's the greatest action star ever lived?",
        answer: "Silvester Stallone")),
    (FlashCard(
        question: "What's my favourite movie?", answer: "Leap Year 2010")),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 250,
                child: FlipCard(
                  front:
                      FlashCardView(text: _flashcards[currentIndex].question),
                  back: FlashCardView(text: _flashcards[currentIndex].answer),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(
                    label: Text('Prev'),
                    icon: Icon(Icons.navigate_before),
                    onPressed: previousCard,
                  ),
                  OutlinedButton.icon(
                      label: Text('Next'),
                      icon: Icon(Icons.navigate_next),
                      onPressed: nextCard)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextCard() {
    setState(() {
      currentIndex =
          currentIndex + 1 < _flashcards.length ? currentIndex + 1 : 0;
    });
  }

  void previousCard() {
    setState(() {
      currentIndex =
          currentIndex - 1 >= 0 ? currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
