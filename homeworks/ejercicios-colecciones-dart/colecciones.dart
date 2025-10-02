import 'dart:collection';

/**
 * Ejercicio 1: List – Lista de notas
 * Crea una lista con las notas de 5 alumnos.
 * - Añade una nueva nota al final.
 * - Muestra la primera y la última nota.
 * - Calcula la media de todas las notas.
 * Usa first, last, reduce y length.
 */

void modificarNotas(List<int> notas, int nota) {
  notas.add(nota);
  print(notas);
  print(notas.first);
  print(notas.last);
  double mediaNotas = notas.reduce((value, element) 
  => value + element) / notas.length;
  print(mediaNotas);
}

/**
 * Ejercicio 2: Set – Correos únicos
 * Crea un conjunto (Set) con correos electrónicos:
 * ["ana@mail.com", "luis@mail.com", "ana@mail.com", "pedro@mail.com"]
 * - Imprime el conjunto para comprobar que no hay duplicados.
 * - Añade un correo nuevo.
 * - Comprueba si "luis@mail.com" está en el set.
 * Usa add y contains.
 */

bool aniadirCorreo(Set<String> correos, String correo) {
  if (correos.contains(correo)) {
    return false;
  }
  return correos.add(correo);
}

/**
 * Ejercicio 3: Map – Diccionario de productos
 * Crea un mapa (Map) donde las claves sean nombres de productos y los valores sean sus precios:
 * {"pan": 1.0, "leche": 1.5, "huevos": 2.0}
 * - Muestra el precio de la leche.
 * - Añade "café": 3.0.
 * - Recorre el mapa e imprime "producto → precio".
 * Usa forEach.
 */

void mostrarPrecioProducto(Map<String, double> productos, String producto) {
  if (productos.containsKey(producto)) {
    print(productos[producto]);
  } else {
    print("el producto no existe");
  }
}

bool aniadirProductos(Map<String, double> productos, String producto, double precio) {
  if (productos.containsKey(producto)) {
    return false;
  }
  productos[producto] = precio;
  return true;
}

void mostrarProductos(Map<String, double> productos) {
  productos.forEach((producto, precio) => print("Producto: ${producto}, Precio: ${precio}"));
}

/**
 * Ejercicio 4: Queue – Cola de tareas
 * Usa una cola (Queue) para representar tareas pendientes:
 * - Empieza con ["Lavar platos", "Hacer compra", "Estudiar"].
 * - Atiende (quita) la primera tarea y muéstrala.
 * - Añade una nueva tarea "Pasear perro".
 * - Muestra todas las tareas restantes.
 * Usa addAll y removeFirst.
 */

bool aniadirTareas(Queue<String> tareas, String nuevaTarea) {
  if (tareas.contains(nuevaTarea)) {
    return false;
  }
  tareas.add(nuevaTarea);
  return true;
}

/**
 * Ejercicio 5: SplayTreeSet – Números ordenados
 * Crea un SplayTreeSet de enteros.
 * - Añade los números 5, 3, 9, 1, 4.
 * - Imprime el conjunto y verifica que están ordenados automáticamente.
 * - Elimina el número 3.
 * - Imprime el conjunto final.
 * Usa addAll y remove.
 */

SplayTreeSet<int> aniadirNumeros(SplayTreeSet<int> numeros, List<int> nuevosNumeros) {
  numeros.addAll(nuevosNumeros);
  return numeros;
}

void main() {
  print('-----Ejercicio 1-----');
  List<int> notas = [1, 2, 3, 4, 5];
  int nota = 6;
  modificarNotas(notas, nota);
  print('-----Ejercicio 2-----');
  Set<String> correos = {"ana@mail.com", "luis@mail.com", "ana@mail.com", "pedro@mail.com"};
  String correo = "luis@mail.com";
  print(correos);
  print(aniadirCorreo(correos, correo));
  print(correos);
  print('-----Ejercicio 3-----');
  Map<String, double> productos = {"pan": 1.0, "leche": 1.5, "huevos": 2.0};
  String productoBuscar = "leche";
  mostrarPrecioProducto(productos, productoBuscar);
  String productoAniadir = "manzana";
  double precio = 1.2;
  print(aniadirProductos(productos, productoAniadir, precio));
  mostrarProductos(productos);
  print('-----Ejercicio 4-----');
  Queue<String> tareas = Queue.from(["Lavar platos", "Hacer compra", "Estudiar"]);
  String tarea = "Pasear perro";
  print(tareas);
  print(tareas.removeFirst());
  print(aniadirTareas(tareas, tarea));
  print(tareas);
  print('-----Ejercicio 5-----');
  SplayTreeSet<int> numeros = SplayTreeSet<int>();
  List<int> nuevosNumeros = [5, 3, 9, 1, 4];
  print(aniadirNumeros(numeros, nuevosNumeros));
  numeros.remove(3);
  print(numeros);
}
