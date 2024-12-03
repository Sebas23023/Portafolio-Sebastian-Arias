import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logica/logica_ejercicio.dart';
import 'pantalla_calculo.dart';

class PantallaDatos extends StatelessWidget {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingreso de Números'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Título personalizado
                  Text(
                    '¡Ingresa tus números!',
                    style: TextStyle(
                      fontSize: constraints.maxWidth > 600 ? 30 : 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  _buildTextField(_num1Controller, 'Ingrese el primer número'),
                  SizedBox(height: 10),
                  _buildTextField(_num2Controller, 'Ingrese el segundo número'),
                  SizedBox(height: 20),
                  // Botón morado con letras negras
                  ElevatedButton(
                    onPressed: () {
                      String num1 = _num1Controller.text;
                      String num2 = _num2Controller.text;

                      if (num1.isNotEmpty && num2.isNotEmpty) {
                        if (_isValidInteger(num1) && _isValidInteger(num2)) {
                          int numero1 = int.parse(num1);
                          int numero2 = int.parse(num2);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PantallaCalculo(
                                resultados: calcularOperaciones(numero1, numero2),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Por favor, ingrese solo números enteros'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Por favor, ingrese ambos números'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    child: Text('Calcular'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false),
      inputFormatters: [
        // Limitamos la entrada a solo números enteros
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }

  // Función para validar que la entrada sea un número entero
  bool _isValidInteger(String value) {
    // Verifica si el valor es un número entero válido
    return int.tryParse(value) != null;
  }
}
