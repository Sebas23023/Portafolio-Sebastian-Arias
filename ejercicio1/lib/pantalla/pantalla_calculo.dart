import 'package:flutter/material.dart';

class PantallaCalculo extends StatelessWidget {
  final Map<String, num> resultados;

  PantallaCalculo({required this.resultados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados de Cálculo'),
        backgroundColor: Colors.deepPurple,
        elevation: 10,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(  // Agregado para permitir el desplazamiento
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Título con estilo
                    Text(
                      'Resultados Calculados',
                      style: TextStyle(
                        fontSize: constraints.maxWidth > 600 ? 32 : 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),

                    // Resultado individual con un diseño bonito
                    _buildResultCard('Suma', resultados['suma']),
                    _buildResultCard('Resta', resultados['resta']),
                    _buildResultCard('Multiplicación', resultados['multiplicacion']),
                    _buildResultCard('División', resultados['division']),
                    _buildResultCard('Módulo', resultados['modulo']),

                    // Mostramos resultados invertidos si existen
                    if (resultados['resta_invertida'] != null) ...[
                      _buildResultCard('Resta invertida', resultados['resta_invertida']),
                      _buildResultCard('División invertida', resultados['division_invertida']),
                      _buildResultCard('Módulo invertido', resultados['modulo_invertido']),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard(String label, num? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white.withOpacity(0.8),
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                Icons.calculate,
                color: Colors.deepPurple,
                size: 28,
              ),
              SizedBox(width: 20),
              Text(
                '$label: ${value?.toStringAsFixed(2) ?? 'No disponible'}', // Si el valor es null, mostrar un mensaje más amigable
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
