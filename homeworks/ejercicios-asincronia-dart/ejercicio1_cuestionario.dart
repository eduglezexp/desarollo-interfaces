import 'dart:io';

Future<void> main() async {
  final file = File('datos.txt');

  try {
    String mensaje = await file.readAsString();
    print(mensaje);
  } catch (e) {
    print('Error al leer el archivo: $e');
  }
}