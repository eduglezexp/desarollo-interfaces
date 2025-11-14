import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'examen',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Misión Apolo 8 — 1968",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "Earthrise: la Tierra vista desde la Luna",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: Text(
                "El 24 de diciembre de 1968, mientras orbitaban la Luna, los astronautas del Apolo 8 presenciaron algo que nadie había visto jamás: la Tierra elevándose sobre el horizonte lunar. En ese instante capturaron la icónica fotografía Earthrise, que transformó para siempre la forma en que la humanidad se veía a sí misma en el cosmos.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),  
            ),
            SizedBox(height: 5,),
            Image.asset("assets/images/earthrise.webp", width: 400, height: 400,),
          ],
        )
      ),
    );
  }
}
