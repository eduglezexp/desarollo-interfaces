import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Color dinámico'),
          centerTitle: true,
        ),
        body: Center(
          child: TextSliderWidget(),
        ),
      ),
    );
  }
}

///Quinto ejercicio del cuestionario 1.20
class ColorSliderWidget extends StatefulWidget {
  const ColorSliderWidget({super.key});

  @override
  State<ColorSliderWidget> createState() => _ColorSliderWidgetState();
  
}

class _ColorSliderWidgetState extends State<ColorSliderWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

///Cuarto ejercicio del cuestionario 1.20
class TextSliderWidget extends StatefulWidget {
  const TextSliderWidget({super.key});

  @override
  State<TextSliderWidget> createState() => _TextSliderWidgetState();
  
}

class _TextSliderWidgetState extends State<TextSliderWidget> {

  double _fontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Texto dinámico", 
          style: TextStyle(fontSize: _fontSize),
        ),
        Slider(
          value: _fontSize,
          min: 10,
          max: 60, 
          onChanged: (fontSize) {
            setState(() {
              _fontSize = fontSize;
            });
          },
        ),
      ],
    );
  }
}

///Tercer ejercicio del cuestionario 1.20
class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  double _value = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: _value,
          min: 0,
          max: 100, 
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
        Text(_value.toStringAsFixed(1)),
      ],
    );
  }
}

///Segundo ejercicio del cuestionario 1.20
class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {

  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: _isOn, 
          onChanged: (bool value) {
              setState(() {
                _isOn = value;
              });
          },
        ),
        Text(_isOn ? 'Interruptor activado' : 'Interruptor desactivado'),
      ],
    );
  }
}


///Primer ejercicio del cuestionario 1.20
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Has pulsado $_counter veces', 
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20,),
        ElevatedButton(
          onPressed: () => setState(() {
              _counter++;
            }
          ), 
          child: Text("Púlsame"),
        ),
      ],
    );
  }
}
