void main() {
  Map<String, dynamic> puntuaciones = {'Ana': 10, 'Luis': 'Hola', 'Sofia': 1.0};

  // var configuracion = <String, String>{};

  print(puntuaciones['Ana']);
  print(puntuaciones.containsKey('Ana'));
  print(puntuaciones.remove('Ana'));
  print(puntuaciones.keys);
  print(puntuaciones.values);
}
