import 'package:flutter/material.dart';
import 'dart:math';

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
  List<String> restaurants = ["Burger King", "Zam Zam", "Chicking", "KFC"];

  var index;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Where do you wan to eat ?",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 30),
            if (index != null)
              Text(restaurants[index],
                  style: TextStyle(fontSize: 60, color: Colors.red)),
            SizedBox(height: 30),
            SizedBox(
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  getRestaurant();
                },
                child: Text(
                  'Pick Restaurant',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  void getRestaurant() {
    var random = Random();
    var randomIndex = random.nextInt(restaurants.length);
    setState(() {
      index = randomIndex;
    });
  }
}
