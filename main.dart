import 'package:flutter/material.dart';

import 'practica1.dart';
import 'practica2.dart';
import 'practica3.dart';
import 'practica4.dart';
import 'practica5.dart';
import 'practica6.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prácticas Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prácticas Flutter'),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/k.jpg'), // Ruta de la imagen
                fit: BoxFit.cover, // Ajusta la imagen al tamaño de la pantalla
              ),
            ),
          ),
          // Contenido encima de la imagen
          ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  'CONTADOR DE CLICKS',
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)), // Texto negro
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Practica1()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'CONTADOR CON TEMPORIZADOR Y ALERT DIALOG', 
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)), // Texto negro
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Practica2()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'CONTADOR CON HISTORIAL EN ARCHIVO DE TEXTO', 
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)), // Texto negro
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Practica3()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'ALMACENAMIENTO EN SQLITE', 
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)), // Texto negro
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Practica4()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'CONTADOR CON HISTORIAL ', 
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)), // Texto negro
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Practica5()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'HOLA MUNDO',
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)), // Texto negro
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Practica6()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
