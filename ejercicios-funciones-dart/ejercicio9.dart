/**
 * Ejercicio 9: Crea una funcion que devuelva 
 * otra funcion (closure). La funcion devuelta 
 * debe multiplicar por un factor fijo el 
 * numero que reciba.
 * Ejemplo:
 * var porTres = multiplicador(3);
 * print(porTres(5)); // 15
 */

Function multiplicador(int factor) {
  return (int numero) => numero * factor;
}

void main() {
  var porTres = multiplicador(3);
  print(porTres(5));
}