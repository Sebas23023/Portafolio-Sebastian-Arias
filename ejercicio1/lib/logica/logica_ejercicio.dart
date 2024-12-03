Map<String, num> calcularOperaciones(int num1, int num2) {
  Map<String, num> resultados = {
    'suma': num1 + num2,
    'resta': num1 - num2,
    'multiplicacion': num1 * num2,
    'division': num1 / num2,
    'modulo': num1 % num2,
  };

  if (num1 != num2) {
    resultados['resta_invertida'] = num2 - num1;
    resultados['division_invertida'] = num2 / num1;
    resultados['modulo_invertido'] = num2 % num1;
  }

  return resultados;
}
