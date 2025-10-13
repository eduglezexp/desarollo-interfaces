import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Center(child: 
        Text(
          'Hola Mundo',
          style: TextStyle(
            color: Colors.blue, 
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: "Monserrat",
          ),
        ),
      ),
    )
  );
}