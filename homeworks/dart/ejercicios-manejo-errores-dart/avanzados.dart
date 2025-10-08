/**
Ejercicio 1: Conversor de números con validación
Crea una función toIntSeguro(String valor) que:
- Intente convertir el valor a entero con int.parse.
- Si el valor no es válido, lance un FormatException con el mensaje 
  "Valor inválido: $valor".
- En main, prueba con ["123", "abc", "45"] y atrápalo con try/catch.
 */

int toIntSeguro(String valor) {
    var numero = int.parse(valor);
    return numero;
}

void main() {
  List<String> valores = ["123", "abc", "45"];
  for (var valor in valores) {
    try {
      print(toIntSeguro(valor));
    } on FormatException catch (e) {
      print("Valor inválido: $valor");
    } catch (e) {
      print("Otro error atrapado: $e");
    }
  }
}

/**
Ejercicio 2: Suma de lista segura
Crea una función sumarLista(List<dynamic> datos) que:
- Recorra la lista y sume solo los valores enteros.
- Si encuentra algo que no sea entero, lance una excepción propia 
  ElementoNoEnteroException.
- Maneja el error en main mostrando qué elemento causó el problema.
Ejemplo de entrada: [10, 20, "hola", 5].
 */

class ElementoNoEnteroException implements Exception {
  String mensaje;
  ElementoNoEnteroException(this.mensaje);
  
  @override
  String toString() => "ElementoNoEnteroException: $mensaje";
}

int sumarLista(List<dynamic> datos) {
  int suma = 0;
  for (var elemento in datos) {
    if (elemento is int) {
      suma += elemento;
    } else {
      throw ElementoNoEnteroException("Elemento no entero encontrado: $elemento");
    }
  }
  return suma;
}

void main() {
  List<dynamic> datos = [10, 20, "hola", 5];
  try {
    print(sumarLista(datos));
  } on ElementoNoEnteroException catch (e) {
    print(e);
  } catch (e) {
    print("Otro error atrapado: $e");
  }
}

/**
Ejercicio 3: Multiplicación con dos tipos de errores
Crea una función multiplicar(int? a, int? b) que:
- Lance un ArgumentError si alguno es null.
- Lance una excepción genérica si alguno es negativo.
- Maneja ambos casos en main con bloques on ArgumentError y catch 
  (para el resto).
 */

int multiplicar(int? a, int? b) {
  if (a == null || b == null) {
    throw ArgumentError("Ningún argumento puede ser null");
  }
  if (a < 0 || b < 0) {
    throw Exception("Ningún argumento puede ser negativo");
  }
  return a * b;
}

void main() {
  try {
    print(multiplicar(5, null));
  } on ArgumentError catch (e) {
    print("ArgumentError atrapado: $e");
  } catch (e) {
    print("Otro error atrapado: $e");
  }

  try {
    print(multiplicar(5, -3));
  } on ArgumentError catch (e) {
    print("ArgumentError atrapado: $e");
  } catch (e) {
    print("Otro error atrapado: $e");
  }
}

/**
Ejercicio 4: Reintentos en conexión simulada
Crea una función conectar() que:
- Use Random() para simular que a veces lanza un Exception("Fallo de red").
- Intenta conectarse hasta 3 veces.
- Si tras 3 intentos sigue fallando, lanza un Exception("Conexión fallida 
  tras 3 intentos").
- Maneja el error en main.
 */

import 'dart:math';

void conectar() {
  var random = Random();
  if (!random.nextBool()) {
    throw Exception("Fallo de red");
  }
  print("Conexion exitosa");
}

void main() {
  int intentos = 0;
  const maxIntentos = 3;
  while (intentos < maxIntentos) {
    try {
      conectar();
      break;
    } catch (e) {
      intentos++;
      print("Intento $intentos fallido: $e");
      if (intentos == maxIntentos) {
        print("Conexión fallida tras $maxIntentos intentos");
      }
    }
  }
}

/**
Ejercicio 5: Cargar datos con .catchError()
Crea una función Future<String> cargarArchivo(String nombre) que:
- Si el nombre es "config.txt", devuelva "Archivo cargado".
- En otro caso, lance una excepción "Archivo no encontrado".
- En main, llama a cargarArchivo("datos.txt") y maneja el error con 
  .catchError() en lugar de try/catch.
 */

import 'dart:async';

Future<String> cargarArchivo(String nombre) {
  return Future.delayed(Duration(seconds: 1), () {
    if (nombre == "config.txt") {
      return "Archivo cargado";
    } else {
      throw Exception("Archivo no encontrado");
    }
  });
}

void main() {
  cargarArchivo("datos.txt").then((contenido) {
    print(contenido);
  }).catchError((error) {
    print("Error: $error");
  });
}
