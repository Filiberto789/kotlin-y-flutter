import 'package:flutter/material.dart';
import 'dart:async';


class Practica2 extends StatefulWidget {
  @override
  _Practica2State createState() => _Practica2State();
}

class _Practica2State extends State<Practica2> {
  int _clickCount = 0;
  int _timerCount = 0;
  bool _isTimerRunning = false;
  Timer? _timer;

  void _incrementCounter() {
    setState(() {
      _clickCount++;
    });
  }

  void _startTimer() {
    if (!_isTimerRunning) {
      setState(() {
        _isTimerRunning = true;
        _timerCount = 0;
      });
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _timerCount++;
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contador y Temporizador")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Clics: $_clickCount", style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text("Contar Clics"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _startTimer,
              child: Text("Inicio"),
            ),
            SizedBox(height: 16),
            Text("Tiempo: $_timerCount", style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
