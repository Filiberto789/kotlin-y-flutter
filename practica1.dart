import 'package:flutter/material.dart';



class Practica1 extends StatefulWidget {
  @override
  _Practica1State createState() => _Practica1State();
}

class _Practica1State extends State<Practica1> {
  int _clickCount = 0;

  void _incrementCounter() {
    setState(() {
      _clickCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contador de Clics")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text("Haz clic aquí"),
            ),
            SizedBox(height: 16),
            Text(
              "Clics: $_clickCount",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
