import 'package:flutter/material.dart';


void main() => runApp(MiApp());


class MiApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget principal')),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/images/icon.jpg"),
          child: Stack(
              children: [
                Align(
                  alignment: Alignment(0.6, 0.6),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black45,  
                    child: Text(
                      "Isabel",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,  
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
