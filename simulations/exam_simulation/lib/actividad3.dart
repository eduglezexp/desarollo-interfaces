import 'package:flutter/material.dart';


void main() => runApp(MiApp());


class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      theme: ThemeData(
        colorScheme: colorScheme,
        iconTheme: IconThemeData(
          color: colorScheme.primary,
          size: 40,
        ),
      ),


      home: MyMainWidget(),
    );
  }
}


// 🔹 Widget principal
class MyMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget principal'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Icon(Icons.school),
      ),
    );
  }
}
