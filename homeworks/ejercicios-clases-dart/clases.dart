/**
 * Ejercicio 1: Ejercicio con getter
 * Crea una clase Temperatura que almacene una temperatura en grados Celsius.
 * - Usa un getter para calcular automáticamente el valor en grados Fahrenheit.
 * - En main, muestra la conversión de varias temperaturas.
 */

class Temperatura {
  double celsius;

  Temperatura(this.celsius);

  double get fahrenheit => (celsius * 9/5) + 32;

  void mostrar() => print("$celsius °C = $fahrenheit °F");
}


/**
 * Ejercicio 2: Ejercicio con setter
 * Crea una clase Contraseña con:
 * - Un atributo privado _valor.
 * - Un setter que solo permita asignar contraseñas de al menos 8 caracteres.
 * - En main, prueba a asignar contraseñas válidas e inválidas y muestra mensajes en consola.
 */

class Contrasenia {
  String _valor = "";

  set valor(String nuevaContrasenia) {
    if (nuevaContrasenia.length >= 8) {
      _valor = nuevaContrasenia;
      print("Contrasenia asignada correctamente");
    } else {
      print("Error: La contrasenia debe tener al menos 8 caracteres");
    }
  }

  String get valor => _valor;
}


/**
 * Ejercicio 3: Ejercicio con extends
 * Crea una clase base Empleado con nombre y un método trabajar().
 * Luego crea una clase Programador que extienda Empleado y sobrescriba trabajar()
 * para que imprima "Estoy programando en Dart".
 * En main, crea un programador y haz que trabaje.
 */

class Empleado {
  String nombre;

  Empleado(this.nombre);

  void trabajar() => print("$nombre esta trabajando");
}

class Programador extends Empleado {
  Programador(String nombre) : super(nombre);

  @override
  void trabajar() => print("$nombre esta programando en Dart");
}


/**
 * Ejercicio 4: Ejercicio con clase abstracta
 * Crea una clase abstracta InstrumentoMusical con un método abstracto tocar().
 * Crea dos clases concretas (Guitarra y Piano) que extiendan la abstracta e implementen el método.
 * En main, crea una lista de instrumentos y haz que todos toquen.
 */

abstract class InstrumentoMusical {
  void tocar();
}

class Guitarra extends InstrumentoMusical {
  @override
  void tocar() => print("La guitarra esta sonando");
}

class Piano extends InstrumentoMusical {
  @override
  void tocar() => print("El piano esta sonando");
}


/**
 * Ejercicio 5: Ejercicio con interfaz
 * Define una clase Exportable con un método exportar().
 * Crea dos clases, DocumentoPDF y ImagenPNG, que implementen esa interfaz
 * cada una con su propia versión de exportar().
 * En main, crea una lista de Exportable y exporta todos los elementos.
 */

class Exportable {
  void exportar() {}
}

class DocumentoPDF implements Exportable {
  @override
  void exportar() => print("Exportando documento como PDF");
}

class ImagenPNG implements Exportable {
  @override
  void exportar() => print("Exportando imagen como PNG");
}


 /**
 * Ejercicio 6: Ejercicio con mixin
 * Crea un mixin Recargable que tenga un método recargar().
 * Aplícalo a dos clases muy distintas: Telefono y Linterna.
 * En main, crea ambos objetos y llama a su método recargar().
 */

mixin Recargable {
  void recargar() => print("Recargando...");
}

class Telefono with Recargable {
  void usar() => print("Usando el telefono");
}

class Linterna with Recargable {
  void iluminar() => print("Iluminando con la linterna");
}


/**
 * Ejercicio 7: Ejercicio con clase const
 * Crea una clase ColorRGB con atributos r, g, b (todos final).
 * Haz un constructor const.
 * En main, crea dos colores con los mismos valores y muestra
 * si son idénticos con identical().
 */

class ColorRGB {
  final int r;
  final int g;
  final int b;

  const ColorRGB(this.r, this.g, this.b);
}

void main() {
  print("-----Ejercicio 1-----");
  var temp1 = Temperatura(0);
  temp1.mostrar();
  var temp2 = Temperatura(100);
  temp2.mostrar();

  print("-----Ejercicio 2-----");
  var contrasenia = Contrasenia();
  contrasenia.valor = "12345";
  contrasenia.valor = "contraseniaSegura";
  print("Contrasenia actual: ${contrasenia.valor}");

  print("-----Ejercicio 3-----");
  var programador = Programador("Alice");
  programador.trabajar();

print("-----Ejercicio 4-----");
List<InstrumentoMusical> instrumentos = [Guitarra(), Piano()];
for (var instrumento in instrumentos) {
    instrumento.tocar();
}

print("-----Ejercicio 5-----");
List<Exportable> exportables = [DocumentoPDF(), ImagenPNG()];
for (var item in exportables) {
    item.exportar();
}

print("-----Ejercicio 6-----");
var telefono = Telefono();
telefono.usar();
telefono.recargar();

var linterna = Linterna();
linterna.iluminar();
linterna.recargar();

print("-----Ejercicio 7-----");
var color1 = const ColorRGB(255, 0, 0);
var color2 = const ColorRGB(255, 0, 0);
print("¿Son idénticos? ${identical(color1, color2)}");
}