import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      home: FavoriteButton(),
    );
  }
}

class VolumeControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo StatefulWidget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Volumen: "),
            Icon(),
            Slider(
              value: value,
              min: 0,
              max: 100, 
              onChanged: (value) {
                setState(() {
                  
                });
              }    
            )
          ],
        ),
      ),
    );
  }
}

class VolumeProvider extends ChangeNotifier {
  double _volume = 50.0;

  get volume => _volume;
  set volume(double newVolume) {
    _volume = newVolume;
    notifyListeners();
  }
}

// 🔹 Widget con estado
class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
  // También válido: State<MiWidgetConEstado> createState() => _MiWidgetConEstadoState();
}

// 🔹 Clase de estado asociada al widget
class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  _toggleFavorito() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo StatefulWidget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _toggleFavorito,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              iconSize: 100,
            ),
            SizedBox(height: 20),
            Text(
              isFavorite
                  ? 'Añadido a favoritos'
                  : 'Pulsa para marcar como favorito',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton.icon(
              onPressed: _toggleFavorito,
              label: Text("Cambiar estado"),
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
