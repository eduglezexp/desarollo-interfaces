/**
 * Escribe una funcion que muestre en consola 
 * un mensaje de presentacion con un nombre 
 * obligatorio y una edad opcional 
 * (si no se da edad, usa 0 por defecto).
 */

String mensaje(String nombre, [int? edad]) 
=> "Hola ${nombre} con edad: ${edad ?? 0}";

void main() {
  String nombre = "Edu";
  int edad = 21;
  print(mensaje(nombre));
  print(mensaje(nombre, edad));
}