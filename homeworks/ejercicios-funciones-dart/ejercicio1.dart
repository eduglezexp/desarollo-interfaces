/**
 * Ejercicio 1: Crea una funcion que calcule el area 
 * de un rectangulo a partir de su base y altura, y 
 * la muestre en consola.
 */

double areaRectangulo(double base, double altura) => base * altura;

void main() {
  double base = 3;
  double altura = 4;
  print(areaRectangulo(base, altura));
}