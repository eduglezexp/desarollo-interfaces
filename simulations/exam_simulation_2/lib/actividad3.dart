import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      home: MyMainWidget(),
    );
  }
}

// 🔹 Clase principal
class MyMainWidget extends StatelessWidget {
  const MyMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget principal')),
      body: Center(
        child: Text(
          'Aquí irá tu código',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
