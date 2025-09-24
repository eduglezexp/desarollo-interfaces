/**
 * Ejercicio 2: Haz una funcion que muestre 
 * un saludo en consola. El saludo debe poder 
 * llevar opcionalmente un apellido.
 */

String saludo([String? apellido]) => "Un saludo ${apellido ?? ""}";

void main() {
  String apellido = "González";
  print(saludo());
  print(saludo(apellido));
}