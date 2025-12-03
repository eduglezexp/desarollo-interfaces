import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  bool _small = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Implicit Animation: AnimatedContainer")),
        body: Center(
          child:  AnimatedContainer(
            duration: Duration(seconds: 1),
            width: _small ? 100 : 200,
            height: _small ? 100 : 200,
            color: _small ? Colors.red : Colors.blue,
            curve: Curves.easeInOut,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              _small = !_small;
            });
          },
        ),
      ),
    );
  }
}