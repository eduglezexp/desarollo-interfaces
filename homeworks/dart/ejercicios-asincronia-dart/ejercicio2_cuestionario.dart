import 'dart:io';

Future<void> main() async {
  print('Comprobando conexión a Internet...');

  try {
    List<InternetAddress> ip = await InternetAddress.lookup('google.com');
    print(ip);
  } on SocketException catch (_) {
    print('❌ Sin conexión a Internet');
  }
}