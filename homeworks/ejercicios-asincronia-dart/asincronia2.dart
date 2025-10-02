/**
Ejercicio 1: Stream de sensores de temperatura
Crea un Stream<int> que emita lecturas de temperatura cada 
medio segundo: [20, 21, 22, 23, 24].
- Si la temperatura supera 22, imprime "⚠️ ¡Temperatura alta!".
- Al terminar, imprime "✅ Sensor apagado".
 */

Stream<int> sensorTemperatura() async* {
  List<int> temperaturas = [20, 21, 22, 23, 24];
  for (var temp in temperaturas) {
    await Future.delayed(Duration(milliseconds: 500));
    yield temp;
  }
}

void main() async {
  Stream<int> stream = sensorTemperatura();
  stream.listen((temp) {
    print("Temperatura: $temp°C");
    if (temp > 22) {
      print("⚠️ ¡Temperatura alta!");
    }
  }, onDone: () {
    print("✅ Sensor apagado");
  });
}

/**
Ejercicio 2: Stream broadcast de mensajes de chat
Simula un chat con un StreamController.broadcast().
- Envía tres mensajes: "Hola", "¿Cómo estás?", "Adiós".
- Suscríbete con dos oyentes distintos y comprueba que 
  ambos reciben los mismos mensajes.
 */

import 'dart:async';

void main() {
  StreamController<String> chatController = StreamController<String>.broadcast();

  chatController.stream.listen((mensaje) {
    print("Oyente 1 recibió: $mensaje");
  });

  chatController.stream.listen((mensaje) {
    print("Oyente 2 recibió: $mensaje");
  });

  chatController.add("Hola");
  chatController.add("¿Cómo estás?");
  chatController.add("Adiós");

  chatController.close();
}

/**
Ejercicio 3: Transformaciones de stream de números
Crea un Stream<int> con los números del 1 al 5.
- Filtra solo los números pares (where).
- Transfórmalos multiplicándolos por 10 (map).
- Imprime el resultado.
 */

Stream<int> numeros() async* {
  for (int i = 1; i <= 5; i++) {
    yield i;
  }
}

void main() async {
  Stream<int> stream = numeros();
  stream
    .where((num) => num.isEven)
    .map((num) => num * 10)
    .listen((result) => print(result));
}

/**
Ejercicio 4: Manejo de errores en streams
Crea un StreamController<String>.
- Emite "dato1", "dato2", luego un error "fallo de red", 
  y finalmente "dato3".
- Suscríbete e imprime los datos normales con "Recibido: ...", 
  pero los errores con "❌ Error detectado: ...".
- Cuando se cierre, imprime "Stream cerrado".
 */

import 'dart:async';

void main() {
  StreamController<String> controller = StreamController<String>();

  controller.stream.listen((data) {
    print("Recibido: $data");
  }, onError: (error) {
    print("❌ Error detectado: $error");
  }, onDone: () {
    print("Stream cerrado");
  });

  controller.add("dato1");
  controller.add("dato2");
  controller.addError("fallo de red");
  controller.add("dato3");

  controller.close();
}

/**
Ejercicio 5: Stream periódico con cancelación
Crea un Stream.periodic que emita "tick 1", "tick 2", etc. cada segundo.
- Cancela la suscripción automáticamente después de recibir 3 ticks.
 */

void main() {
  Stream<String> ticker = Stream.periodic(Duration(seconds: 1), 
  (count) => "tick ${count + 1}");
  StreamSubscription<String>? subscription;
  int ticksRecibidos = 0;

  subscription = ticker.listen((tick) {
    print(tick);
    ticksRecibidos++;
    if (ticksRecibidos >= 3) {
      subscription?.cancel();
      print("Suscripción cancelada tras 3 ticks");
    }
  });
}

/**
Ejercicio 6: Suma grande con isolate
Usa un Isolate para calcular la suma de los números del 1 al 1.000.000.
- El isolate devuelve el resultado.
- El main imprime "Resultado recibido: ..." al recibirlo.
 */

import 'dart:isolate';

void sumar(SendPort sendPort) {
  int suma = 0;
  for (int i = 1; i <= 1000000; i++) {
    suma += i;
  }
  sendPort.send(suma);
}

void main() async {
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(sumar, receivePort.sendPort);
  receivePort.listen((message) {
    print("Resultado recibido: $message");
    receivePort.close();
  });
}

/**
Ejercicio 7: Factorial en un isolate
Define una función que calcule el factorial de un número.
- Lanza un isolate que reciba un número (ejemplo 5).
- Devuelva el factorial (120).
 */



/**
Ejercicio 8: Isolate con lista de nombres
Envía una lista de nombres a un isolate.
- El isolate convierte todos los nombres a mayúsculas.
- Devuelve la lista al main.
 */

 

/**
Ejercicio 9: Isolate con múltiples mensajes
Crea un isolate que reciba un SendPort.
- Envía tres mensajes diferentes al main: "Inicio", "Procesando...", 
  "Fin".
- El main imprime cada mensaje según llega.
 */



/**
Ejercicio 10: Uso de compute en Flutter (ejercicio conceptual)
Imagina que tienes una función que convierte un texto grande a 
minúsculas.
- Simula cómo usarías compute(miFuncion, texto) en Flutter para 
  no bloquear la UI.
- No hace falta código completo de Flutter, solo el patrón con 
  compute.
 */


 