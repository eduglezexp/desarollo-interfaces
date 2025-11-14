import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
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
      appBar: AppBar(title: Text('Campos de texto')),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 450),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyTextField(
                hint: "Email or username",
                icon: Icons.lock,
              ),
              SizedBox(height: 20),
              MyTextField(
                hint: "Password",
                icon: Icons.lock,
                obscure: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;


  const MyTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscure = false,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black,
        prefixIcon: Icon(icon),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
      ),
    );
  }
}
