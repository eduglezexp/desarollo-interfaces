/**
 * Implementa una funcion operar que reciba dos 
 * numeros y otra funcion que defina la operacion. 
 * Haz que se pueda usar con suma, resta, 
 * multiplicacion y division.
 */

double sumar(double numero1, double numero2) => numero1 + numero2;
double restar(double numero1, double numero2) => numero1 - numero2;
double multiplicar(double numero1, double numero2) => numero1 * numero2;
double dividir(double numero1, double numero2) => numero1 / numero2;

void operar(double numero1, double numero2, double Function(double, double) funcion) {
  print(funcion(numero1, numero2));
}

void main() {
  double numero1 = 3;
  double numero2 = 4;
  operar(numero1, numero2, sumar);
  operar(numero1, numero2, restar);
  operar(numero1, numero2, multiplicar);
  operar(numero1, numero2, dividir);
}