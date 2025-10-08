/**
Ejercicio 1: Future básico con retraso
Crea una función Future<String> holaFuture() que:
- Espere 2 segundos con Future.delayed.
- Devuelva el texto "Hola desde el futuro".
En main, llama a esa función usando async/await e imprime el resultado.
 */

Future<String> holaFuture() {
    return Future.delayed(Duration(seconds: 2), () => "Hola desde el futuro");
}

void main() async {
  try {
    String mensaje = await holaFuture();
    print(mensaje);
  } catch (e) {
    print("Error: $e");
  }
}

/**
Ejercicio 2: then() encadenados
Crea un Future<int> que devuelva el número 5.
- Encadena .then() para multiplicarlo por 2.
- Encadena otro .then() para sumarle 10.
- Imprime el resultado final (20).
 */

void main() {
  Future<int>.value(5)
    .then((value) => value * 2)
    .then((value) => value + 10)
    .then((result) => print(result))
    .catchError((error) => print("Error: $error"));
}

/**
Ejercicio 3: Manejo de errores con catchError
Crea una función que devuelva un Future y siempre lance una excepción "Error en la carga".
- Llama a la función y maneja el error con .catchError(), imprimiendo "❌ Error atrapado: ...".
 */

Future<void> funcionConError() {
  return Future.delayed(Duration(seconds: 1), () {
    throw Exception("Error en la carga");
  });
}

void main() {
  funcionConError()
    .then((_) => print("Carga exitosa"))
    .catchError((error) => print("❌ Error atrapado: $error"));
}

/**
Ejercicio 4: Crea una función Future<int> dividir(int a, int b) que:
- Si b == 0, lance una excepción.
- Si no, devuelva la división entera.
En main, llama a la función con dividir(10, 0) usando async/await y 
maneja el error con try/catch.
 */

Future<int> dividir(int a, int b) {
    if (b == 0) {
        throw Exception("No se puede dividir entre cero");
    }
    return Future.value(a ~/ b);
}

void main() async {
  try {
    int resultado = await dividir(10, 0);
    print("Resultado: $resultado");
  } catch (e) {
    print("Error: $e");
  }
}

/**
Ejercicio 5: Esperar múltiples futuros con Future.wait
Crea tres funciones:
- Future<String> tarea1() que espere 1s y devuelva "Tarea 1".
- Future<String> tarea2() que espere 2s y devuelva "Tarea 2".
- Future<String> tarea3() que espere 3s y devuelva "Tarea 3".
En main, espera a que terminen todas usando Future.wait y muestra 
la lista de resultados.
 */

Future<String> tarea1() {
  return Future.delayed(Duration(seconds: 1), () => "Tarea 1");
}

Future<String> tarea2() {
  return Future.delayed(Duration(seconds: 2), () => "Tarea 2");
}

Future<String> tarea3() {
  return Future.delayed(Duration(seconds: 3), () => "Tarea 3");
}

void main() async {
  try {
    List<String> resultados = await Future.wait([tarea1(), tarea2(), tarea3()]);
    print(resultados);
  } catch (e) {
    print("Error: $e");
  }
}

/**
Ejercicio 6: Future.any con el primero que termine
Crea dos funciones:
- Una que espere 2 segundos y devuelva "Lenta".
- Otra que espere 1 segundo y devuelva "Rápida".
En main, usa Future.any para mostrar el primer resultado que llegue.
 */

Future<String> lenta() {
  return Future.delayed(Duration(seconds: 2), () => "Lenta");
}

Future<String> rapida() {
  return Future.delayed(Duration(seconds: 1), () => "Rápida");
}

void main() async {
  try {
    String resultado = await Future.any([lenta(), rapida()]);
    print(resultado);
  } catch (e) {
    print("Error: $e");
  }
}


/**
Ejercicio 7: finally con async/await
Crea una función Future<void> cargarArchivo() que espere 1 segundo y 
luego lance una excepción "Archivo no encontrado".
- En main, llama a la función dentro de un bloque try/catch/finally.
- El finally debe imprimir "Proceso terminado", ocurra o no error.
 */

Future<void> cargarArchivo() {
  return Future.delayed(Duration(seconds: 1), () {
    throw Exception("Archivo no encontrado");
  });
}

void main() async {
  try {
    await cargarArchivo();
  } catch (e) {
    print("Error: $e");
  } finally {
    print("Proceso terminado");
  }
}

/**
Ejercicio 8: Uso de async/await en bucle
Crea una lista de 3 URLs simuladas: ["url1", "url2", "url3"].
- Por cada URL, espera 1 segundo y luego imprime "Descargada <url>".
- Hazlo con un for y await dentro.
 */

Future<void> descargar(String url) async {
  await Future.delayed(Duration(seconds: 1));
  print("Descargada $url");
}

void main() async {
  try {
    List<String> urls = ["url1", "url2", "url3"];
    for (String url in urls) {
      await descargar(url);
    }
  } catch (e) {
    print("Error: $e");
  }
}