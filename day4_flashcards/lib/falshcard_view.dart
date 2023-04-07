import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  var text;

  FlashCardView({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 30),textAlign: TextAlign.center,
      )),
    );
  }
}
