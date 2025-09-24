/**
 * Ejercicio 3: Define una funcion que devuelva 
 * el mayor de tres numeros enteros.
 */

int mayorTresNumeros(int numero1, int numero2, int numero3) {
  List<int> numeros = [numero1, numero2, numero3];
  numeros.sort();
  return numeros[numeros.length - 1];
}

void main() {
  int numero1 = 3;
  int numero2 = 4;
  int numero3 = 6;
  print(mayorTresNumeros(numero1, numero2, numero3));
}