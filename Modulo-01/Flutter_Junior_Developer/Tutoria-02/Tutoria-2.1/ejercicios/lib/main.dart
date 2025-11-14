void main() {
  nivel1_ejercicios();
}

void nivel1_ejercicios() {
  print('---- Nivel 1: Ejercicios Básicos ----');

  // 1. (Listas) Mi Primera Lista
  List<String> frutas = ['Mango', 'Fresa', 'Piña', 'Cereza', 'Maracuya'];
  print(frutas[1]);
  frutas.add('Manzana');
  print(frutas);
  frutas.removeAt(0);
  print(frutas);

  // 2. (Mapas) Diccionario de Vehiculo
  Map<String, dynamic> vehiculo = {
    'marca': 'Toyota',
    'modelo': 'y2gb3',
    'anio': 2020,
    'esElectrico': false,
  };

  print(vehiculo);
  print(vehiculo['modelo']);
  print(vehiculo['anio'] = 2019);
  print(vehiculo['color'] = 'Rojo');
  print(vehiculo);

  // 3. (Listas + .where) Filtrador de Números Pares
  List<int> numeros = [1, 5, 8, 12, 15, 22, 30];
  print('Lista original: $numeros');

  var paresIterables = numeros.where((n) {
    return n % 2 == 0;
  }).toList();

  print('Lista de numeros pares: $paresIterables');

  // 4. (Listas + .map) Duplicador de numeros
  var dobles = numeros.map((n) {
    return n * 2;
  }).toList();

  print('Lista de dobles: $dobles');

  // 5. (Funciones flecha) Convertidor Rápido
  // Rehaciendo ejercicio 3 (.where)
  var paresFlecha = numeros.where((n) => n % 2 == 0).toList();
  print('Lista de numeros pares: $paresFlecha');

  // Rehaciendo ejercicio 4 (.map)
  var doblesFlecha = numeros.map((n) => n * 2).toList();
  print('Lista de dobles: $doblesFlecha');
}

class EstudianteMejorado {
  String nombre;
  int edad;
  String carrera;

  EstudianteMejorado(this.nombre, this.edad, this.carrera);

  EstudianteMejorado.moderno({
    required this.nombre,
    this.edad = 0,
    required this.carrera,
  });

  void presentarse() {
    print('Mi nombre es $nombre, tengo $edad y estudio $carrera.');
  }
}
