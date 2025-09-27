/**
 * Ejercicio 1: Constructor normal
 * Crea una clase Pelicula con atributos titulo y anio.
 * - Haz un constructor normal que reciba ambos.
 * - En main, crea una película y muestra sus datos.
 */

class Pelicula {
  String titulo;
  int anio;
  Pelicula(this.titulo, this.anio);
  void mostrar() => print("Pelicula: $titulo ($anio)");
}

/**
 * Ejercicio 2: Constructor nombrado
 * Crea una clase Tarea con atributos descripcion y completada.
 * - Haz un constructor normal.
 * - Haz un constructor nombrado incompleta que solo reciba 
 * la descripción y ponga completada = false.
 * - En main, crea una tarea con cada constructor y muestra su estado.
 */

class Tarea {
  String descripcion;
  bool completada;

  Tarea(this.descripcion, this.completada);
  Tarea.incompleta(this.descripcion) : completada = false;

  void mostrar() => print("Tarea: $descripcion - Completada: $completada");
}

/**
 * Ejercicio 3: Constructor con inicialización (:)
 * Crea una clase Circulo con atributos radio y area.
 * - Haz un constructor que inicialice area 
 * usando : area = 3.14 * radio * radio.
 * - En main, crea un círculo y muestra su área.
 */

class Circulo {
  double radio;
  double area;

  Circulo(this.radio) : area = 3.14 * radio * radio;
  void mostrar() => print("Circulo: radio = $radio, área = $area"); 
}

/**
 * Ejercicio 4: Constructor con parámetros nombrados ({})
 * Crea una clase Mensaje con atributos texto y prioridad.
 * - Haz un constructor con parámetros nombrados, donde texto 
 * sea obligatorio y prioridad tenga un valor por defecto de "normal".
 * - En main, crea un mensaje con y sin prioridad.
 */

class Mensaje {
  String texto;
  String prioridad;

  Mensaje(this.texto, {this.prioridad = "normal"});
  void mostrar() => print("Mensaje: $texto (proridad: $prioridad)");
}

/**
 * Ejercicio 5: Constructor const
 * Crea una clase Moneda con atributos codigo y simbolo (final).
 * - Haz un constructor const.
 * - En main, crea dos monedas iguales (USD, $) y muestra si son idénticas con identical().
 */

class Moneda {
  final String codigo;
  final String simbolo;

  const Moneda(this.codigo, this.simbolo);
}

/**
 * Ejercicio 6: Constructor con redirección
 * Crea una clase Alumno con atributos nombre y nota.
 * - Haz un constructor normal.
 * - Haz un constructor redirigido Alumno.aprobado(nombre) que ponga la nota en 5.
 * - En main, crea un alumno con cada constructor y muestra sus datos.
 */

class Alumno {
  String nombre;
  double nota;

  Alumno(this.nombre, this.nota);
  Alumno.aprobado(this.nombre) : nota = 5;
  void mostrar() => print("Alumno: $nombre (nota: $nota)");
}

/**
 * Ejercicio 7: Constructor de fábrica (factory)
 * Crea una clase Sesion que solo permita tener una única sesión activa.
 * - Haz un constructor privado _interna.
 * - Haz un constructor factory que devuelva siempre la misma sesión.
 * - En main, crea dos sesiones y muestra si son idénticas.
 */

class Sesion {
  static final Sesion _instancia = Sesion._interna();
  factory Sesion() {
    return _instancia;
  }
  Sesion._interna();
}

void main() {
  print("-----Ejercicio1-----");
  var peli = Pelicula("Master & Commander", 2003);
  peli.mostrar();
  print("-----Ejercicio2-----");
  var tarea = Tarea("Terminada", true);
  tarea.mostrar();
  print("-----Ejercicio3-----");
  var circulo = Circulo(2);
  circulo.mostrar();
  print("-----Ejercicio4-----");
  var mensaje1 = Mensaje("Hola");
  var mensaje2 = Mensaje("Urgente", prioridad: "alta");
  mensaje1.mostrar();
  mensaje2.mostrar();
  print("-----Ejercicio5-----");
  var moneda1 = const Moneda("USD", "\$");
  var moneda2 = const Moneda("USD", "\$");
  print("¿Son identicas? ${identical(moneda1, moneda2)}");
  print("-----Ejercicio6-----");
  var alumno1 = Alumno("Antonio", 9);
  var alumno2 = Alumno.aprobado("Alberto");
  alumno1.mostrar();
  alumno2.mostrar();
  print("-----Ejercicio7-----");
  var sesion1 = Sesion();
  var sesion2 = Sesion();
  print("¿Son identicas? ${identical(sesion1, sesion2)}");
}