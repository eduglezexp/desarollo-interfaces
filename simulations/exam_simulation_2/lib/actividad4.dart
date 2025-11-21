import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',

      theme: ThemeData(
        // Color semilla
        colorSchemeSeed: const Color(0xFFF7F3E9),

        // Estilos de texto
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFF003366),
            fontSize: 34,
            fontWeight: FontWeight.bold,
            fontFamily: 'Garamound',
          ),
          titleMedium: TextStyle(
            color: Color(0xFF003366),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Garamound',
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF2B2B2B),
            fontSize: 18,
            fontWeight: FontWeight.normal,
            fontFamily: 'Times New Roman',
            height: 1.5,
          ),
        ),

        // Botón
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF003366),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),

      home: const MyMainWidget(),
    );
  }
}

class MyMainWidget extends StatelessWidget {
  const MyMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget principal'),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),

      body: Container(
        width: double.infinity,
        color: const Color(0xFFF7F3E9),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: const GettysburgContent(),
          ),
        ),
      ),
    );
  }
}

/// 🔹 Widget refactorizado con el contenido central
class GettysburgContent extends StatelessWidget {
  const GettysburgContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Título grande
        Text(
          "DISCURSO DE GETTYSBURG",
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 12),

        // Subtítulo
        Text(
          "Abraham Lincoln, 19 de noviembre de 1863",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 28),

        // Párrafo
        Text(
          "Hace ochenta y siete años, nuestros padres hicieron nacer en este "
          "continente una nueva nación, concebida en Libertad y consagrada al "
          "principio de que todas las personas son creadas iguales. Ahora "
          "estamos envueltos en una gran guerra civil que pone a prueba si esta "
          "nación, o cualquier nación así concebida y así consagrada, puede "
          "perdurar en el tiempo...",
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.justify,
        ),

        const SizedBox(height: 28),

        // Botón
        ElevatedButton(
          onPressed: () {},
          child: const Text("Saber más…"),
        ),
      ],
    );
  }
}
