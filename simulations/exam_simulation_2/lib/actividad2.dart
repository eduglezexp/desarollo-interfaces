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

/// -------------------------------------------
///  WIDGET PRINCIPAL
/// -------------------------------------------
class MyMainWidget extends StatelessWidget {
  const MyMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F0FF),
      appBar: AppBar(
        title: const Text("Widget principal"),
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Center(
        child: _ProfileCard(),
      ),
    );
  }
}

/// -------------------------------------------
///  TARJETA COMPLETA
/// -------------------------------------------
class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        children: [
          const _ProfileHeader(),
          const _SectionDivider(),
          const _ProfileStats(),
          const _SectionDivider(),
          const _EditButton(),
          const _SectionDivider(),
          const _QuickOptions(),
        ],
      ),
    );
  }
}

/// -------------------------------------------
///  HEADER: ICONO + TEXTO
/// -------------------------------------------
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.person, size: 40),
        SizedBox(width: 8),
        Text("Perfil de usuario", style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

/// -------------------------------------------
///  LÍNEA SEPARADORA REUTILIZABLE
/// -------------------------------------------
class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        indent: 20,
        endIndent: 20,
        thickness: 1.3,
      ),
    );
  }
}

/// -------------------------------------------
///  ESTADÍSTICAS (PUNTOS y NOTIFICACIONES)
/// -------------------------------------------
class _ProfileStats extends StatelessWidget {
  const _ProfileStats();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _InfoRow(icon: Icons.star, text: "Puntaje: 120"),
        SizedBox(height: 10),
        _InfoRow(icon: Icons.notifications, text: "Notificaciones: 5"),
      ],
    );
  }
}

/// -------------------------------------------
///  ROW REUTILIZABLE PARA ICONO + TEXTO
/// -------------------------------------------
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}

/// -------------------------------------------
///  BOTÓN EDITAR PERFIL
/// -------------------------------------------
class _EditButton extends StatelessWidget {
  const _EditButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.deepPurple),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        "Editar perfil",
        style: TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}

/// -------------------------------------------
///  OPCIONES RÁPIDAS (Íconos inferiores)
/// -------------------------------------------
class _QuickOptions extends StatelessWidget {
  const _QuickOptions();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Opciones rápidas"),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _QuickOption(icon: Icons.folder, label: "Archivos"),
            SizedBox(width: 28),
            _QuickOption(icon: Icons.settings, label: "Ajustes"),
            SizedBox(width: 28),
            _QuickOption(icon: Icons.help_outline, label: "Ayuda"),
          ],
        ),
      ],
    );
  }
}

/// -------------------------------------------
///  WIDGET REUTILIZABLE PARA OPCIONES
/// -------------------------------------------
class _QuickOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickOption({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
