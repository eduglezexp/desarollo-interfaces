import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Esta es la barra del menu principal')),
        body: Center(
          child: Text('¡Buenos dias! 2DAM'),
        ),
      ),
    );
  }
}

