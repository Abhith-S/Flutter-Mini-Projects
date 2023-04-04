import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//we have to create MyApp and MyApp state
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> selection = [true, false, false];
  var tip;
  final TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (tip != null)
                Text(
                  'Tip is $tip',
                  style: TextStyle(fontSize: 30),
                ),
              SizedBox(height: 50),
              Text(
                "Total Amount",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 80,
                child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '\$100.00',
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ToggleButtons(
                isSelected: selection,
                onPressed: updateSelection,
                children: const <Widget>[Text("10%"), Text("15%"), Text("25%")],
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: calculateTip,
                  child: Text(
                    "Calculate Tip",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < selection.length; i++) {
        selection[i] = selectedIndex == i;
      }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(myController.text);
    final selectedIndex = selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];

    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

    setState(() {
      tip = '\$$tipTotal';
    });
  }
}
