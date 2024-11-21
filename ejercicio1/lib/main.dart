import 'package:flutter/material.dart';
import 'ui/interfaz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Interfaz(),
    );
  }
}