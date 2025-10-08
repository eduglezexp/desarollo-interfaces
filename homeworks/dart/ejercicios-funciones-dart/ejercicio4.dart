/**
 * Ejercicio 4: Crea una funcion que reciba 
 * una lista de numeros y devuelva la suma 
 * de todos ellos.
 */

int suma(List<int> numeros) {
  int suma = 0;
  for (int numero in numeros) {
    suma += numero;
  }
  return suma;
}

void main() {
  List<int> numeros = [1, 2, 3, 4, 5, 6];
  print(suma(numeros));
}