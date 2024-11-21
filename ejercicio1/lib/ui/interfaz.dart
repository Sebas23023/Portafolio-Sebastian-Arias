import 'package:flutter/material.dart';

class Interfaz extends StatefulWidget {
  @override
  _InterfazState createState() => _InterfazState();
}

class _InterfazState extends State<Interfaz> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = "";
  String _error = "";

  void _calcular() {
    setState(() {
      _error = "";
      _resultado = "";

      // Validación de la entrada
      String input = _controller.text.trim();
      if (input.isEmpty) {
        _error = "El campo no puede estar vacío.";
      } else {
        // Intentar parsear el número ingresado
        int? numero = int.tryParse(input);
        if (numero == null) {
          _error = "Por favor, ingrese un número válido.";
        } else {
          // Si el número es válido, calcular el siguiente número
          int siguienteNumero = numero + 1;
          _resultado = "El número siguiente al $numero es $siguienteNumero";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba EJERCICIO1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un número',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              child: Text('Calcular Número Siguiente'),
            ),
            SizedBox(height: 20),
            // Mostrar mensaje de error si la entrada no es válida
            if (_error.isNotEmpty)
              Text(
                _error,
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            // Mostrar el resultado si el número es válido
            if (_resultado.isNotEmpty)
              Text(
                _resultado,
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
