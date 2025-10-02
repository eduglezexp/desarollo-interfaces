/**
Ejercicio 1: División por cero
void dividir(int a, int b) {
  // TODO: Si b es 0, lanza una excepción con throw
  print(a / b);
}

void main() {
  try {
    dividir(10, 0);
  } 
  // TODO: Atrapa la excepción y muestra "Error: división por cero"
}
 */

void dividir(int a, int b) {
  if (b == 0) {
    throw Exception("No se puede dividir entre cero");
  }
  print(a / b);
}

void main() {
  try {
    dividir(10, 0);
  } catch (e) {
    print("Error atrapado: $e");
  }
}

/**
Ejercicio 2: Índice fuera de rango
void main() {
  var lista = [1, 2, 3];

  try {
    print(lista[5]); // ❌ Esto da error
  } 
  // TODO: Usa on RangeError para capturar este error en específico
}
 */

void main() {
  var lista = [1, 2, 3];

  try {
    print(lista[5]);
  } on RangeError catch (e) {
    print("Error atrapado: $e");
  } catch (e) {
    print("Otro error atrapado: $e");
  }
}

/**
Ejercicio 3: Formato inválido
void main() {
  try {
    var numero = int.parse("abc"); // ❌ Esto da FormatException
    print(numero);
  } 
  // TODO: Usa on FormatException y muestra un mensaje claro
}
 */

void main() {
  try {
    var numero = int.parse("abc");
    print(numero);
  } on FormatException catch (e) {
    print("Error de formato atrapado: $e");
  } catch (e) {
    print("Otro error atrapado: $e");
  }
}

/**
Ejercicio 4: Uso de finally
void abrirArchivo() {
  print("📂 Archivo abierto");
  throw Exception("Error al leer archivo");
}

void main() {
  try {
    abrirArchivo();
  } 
  // TODO: Captura el error
  // TODO: Añade un bloque finally que muestre "📕 Archivo cerrado"
}
 */

void abrirArchivo() {
  print("📂 Archivo abierto");
  throw Exception("Error al leer archivo");
}

void main() {
  try {
    abrirArchivo();
  } catch (e) {
    print("Error atrapado: $e");
  } finally {
    print("📕 Archivo cerrado");
  }
}

/**
Ejercicio 5: Excepción personalizada
// TODO: Crea una clase DivisionPorCeroException que implemente Exception
//       y sobrescriba toString() para mostrar "🚫 División prohibida"

void dividir(int a, int b) {
  // TODO: Lanza tu excepción personalizada si b == 0
  print(a / b);
}

void main() {
  try {
    dividir(8, 0);
  } 
  // TODO: Atrapa tu excepción personalizada y muéstrala
}
 */

class DivisionPorCeroException implements Exception {
  @override
  String toString() => "🚫 División prohibida";
}

void dividir(int a, int b) {
  if (b == 0) {
    throw DivisionPorCeroException();
  }
  print(a / b);
}

void main() {
  try {
    dividir(8, 0);
  } on DivisionPorCeroException catch (e) {
    print("Error atrapado: $e");
  } catch (e) {
    print("Otro error atrapado: $e");
  }
}

/**
Ejercicio 6: Async y manejo de errores
Future<void> cargarDatos() async {
  await Future.delayed(Duration(seconds: 1));
  // TODO: Lanza una excepción aquí simulando un fallo de conexión
}

void main() async {
  try {
    await cargarDatos();
  } 
  // TODO: Atrapa el error y muestra "Error: no se pudieron cargar los datos"
}
 */

Future<void> cargarDatos() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception("Fallo de conexión");
}

void main() async {
  try {
    await cargarDatos();
  } catch (e) {
    print("Error: no se pudieron cargar los datos - $e");
  }
}
