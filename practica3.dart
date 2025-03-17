import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';



class Practica3 extends StatefulWidget {
  @override
  _Practica3State createState() => _Practica3State();
}

class _Practica3State extends State<Practica3> {
  int clickCount = 0;
  int timerCount = 15;
  bool isTimerRunning = false;
  late Timer _timer;
  String scoreData = '';

  @override
  void initState() {
    super.initState();
    _loadScoreData();
  }

  // Inicia el temporizador
  void startTimer() {
    if (!isTimerRunning) {
      isTimerRunning = true;
      timerCount = 15;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (timerCount > 0) {
            timerCount--;
          } else {
            _timer.cancel();
            isTimerRunning = false;
            saveScoreData(clickCount, 15);
          }
        });
      });
    }
  }

  // Guardar puntajes
  Future<void> saveScoreData(int clicks, int time) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/score_data.txt');
    await file.writeAsString('Clics: $clicks, Tiempo: $time\n', mode: FileMode.append);
    _loadScoreData();
  }

  // Cargar puntajes
  Future<void> _loadScoreData() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/score_data.txt');
    if (await file.exists()) {
      setState(() {
        scoreData = file.readAsStringSync();
      });
    } else {
      setState(() {
        scoreData = 'No hay datos guardados.';
      });
    }
  }

  @override
  void dispose() {
    if (isTimerRunning) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Clics: $clickCount', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Tiempo: $timerCount', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  clickCount++;
                });
              },
              child: Text('Hacer Clic'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: startTimer,
              child: Text('Iniciar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Historial de Puntajes'),
                    content: Text(scoreData),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Ver Puntajes'),
            ),
          ],
        ),
      ),
    );
  }
}