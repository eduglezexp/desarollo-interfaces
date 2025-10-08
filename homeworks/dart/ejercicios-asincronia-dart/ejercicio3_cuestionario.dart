import 'dart:io';

Future<void> main() async {
  final file = File('registro.txt');
  final fecha = DateTime.now();
  try {
    await file.writeAsString("$fecha\n", mode: FileMode.append);
    print("Registro guardado correctamente.");
  } catch (e) {
    print("Error al guardarlos datos ${e}");
  }
}