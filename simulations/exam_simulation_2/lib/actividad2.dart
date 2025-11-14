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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 40),
                  Text("Perfil de usuario"),
                ],
              ),
              SizedBox(height: 8,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, size: 20),
                      Text("Puntos: 120"),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications, size: 20),
                      Text("Notificaciones"),
                    ],
                  )
                ],
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                onPressed: null, 
                child: Text(
                  "Editar perfil", 
                  style: TextStyle(
                    color: Colors.deepPurple
                  ),
                )
              ),
              SizedBox(height: 24,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Opciones rápidas"),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.folder),
                          Text("Archivos")
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.settings),
                          Text("Ajustes")
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.help_outline),
                          Text("Ayuda")
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
