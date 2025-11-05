import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
        Scaffold(
          appBar: AppBar(
            title: Text('Mi primera widget personalizado'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InfoCard(
                title: "Información útil", 
                icon: Icon(
                  Icons.info,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
              InfoCard(
                title: "Ajustes del sistema", 
                icon: Icon(
                  Icons.settings,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
              InfoCard(
                title: "Usuario activo", 
                icon: Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ],
          )
        ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final Icon icon;  
  const InfoCard({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
          padding: EdgeInsetsGeometry.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: 10,),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
