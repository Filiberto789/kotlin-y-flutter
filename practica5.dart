import 'package:flutter/material.dart';
import 'database_helper.dart'; // Asegúrate de que esta importación sea correcta



class Practica5 extends StatefulWidget {
  @override
  _Practica5State createState() => _Practica5State();
}

class _Practica5State extends State<Practica5> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  int _score = 0;
  int _timeRemaining = 15; // 15 segundos para el temporizador

  @override
  void initState() {
    super.initState();
    _loadLastScore();
    _startTimer();
  }

  Future<void> _loadLastScore() async {
    _score = await _dbHelper.getLastScore();
    setState(() {});
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
        _startTimer();
      } else {
        _dbHelper.insertScore(_score);
        setState(() {
          _timeRemaining = 0;
        });
      }
    });
  }

  void _incrementScore() {
    setState(() {
      _score++;
    });
  }

  void _showLastScore() async {
    int lastScore = await _dbHelper.getLastScore();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Último puntaje guardado: $lastScore')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Puntaje: $_score',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Tiempo: $_timeRemaining s',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementScore,
              child: const Text('Hacer Clic'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showLastScore,
              child: const Text('Ver Puntaje Guardado'),
            ),
          ],
        ),
      ),
    );
  }
}