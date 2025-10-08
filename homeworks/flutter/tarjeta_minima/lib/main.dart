import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TarjetaMinimaScreen(),
    );
  }
}

class TarjetaMinimaScreen extends StatelessWidget {
  const TarjetaMinimaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tarjeta Minima'),),
      body: Center(
        child: Column(
          children: 
          [ 
            const Icon(
              Icons.credit_card, 
              size: 100, 
              color: Colors.amber,
            ),
            const Text('Tarjeta de credito'),
          ]
        ),
      ),
    );
  }
}
