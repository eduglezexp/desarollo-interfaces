import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      home: MiWidgetConEstado(),
    );
  }
}

// 🔹 Widget con estado
class MiWidgetConEstado extends StatefulWidget {
  @override
  _MiWidgetConEstadoState createState() => _MiWidgetConEstadoState();
  // También válido: State<MiWidgetConEstado> createState() => _MiWidgetConEstadoState();
}

// 🔹 Clase de estado asociada al widget
class _MiWidgetConEstadoState extends State<MiWidgetConEstado> {
  TextEditingController controller = TextEditingController();
  String text = 'Aquí irá el contenido del widget con estado';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo StatefulWidget')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(100),
          child: Column(
          children: [
            TextField(controller: controller),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  text = controller.text;
                });
              } , 
              child: Text("Mostrar texto")
            ),
            SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ]
        ), 
        )
      ),
    );
  }
}