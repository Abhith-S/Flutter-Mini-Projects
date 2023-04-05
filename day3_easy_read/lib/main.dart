import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _fontSize = 30;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Expanded(
                child: TextField(
                  style: TextStyle(fontSize: _fontSize),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(hintText: 'Enter text here'),
                ),
              ),
              Slider(
                value: _fontSize,
                onChanged: (newSize) {
                  setState(() {
                    _fontSize = newSize;
                  });
                },
                min: 30,
                max: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
