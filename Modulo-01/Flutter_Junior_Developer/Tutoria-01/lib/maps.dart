void main() {
  // Creamos un mapa de strings
  Map<String, String> persona = {'nombre': 'Andres', 'apellido': 'Hernandez'};
  print(persona);

  // Creamos un mapa de Strings y enteros
  Map<String, int> numeros = {'uno': 1, 'dos': 2, 'tres': 3};
  print(numeros);

  // Creamos un mapa de listas
  Map<String, List<int>> matrices = {
    'matriz1': [1, 2, 3],
    'matriz2': [4, 5, 6],
  };
  print(matrices);

  // Creamos un mapa de mapas
  Map<String, Map<String, int>> personas = {
    'persona1': {'edad': 25},
    'persona2': {'edad': 30},
  };
  print(personas);

  // Llamamos la funcion para imprimir un mapa
  imprimirMapa(persona);
}

// Función para imprimir un mapa
void imprimirMapa(Map<String, dynamic> mapa) {
  print(mapa); // Imprime el contenido del mapa
  print(mapa['clave1']); // Imprime el valor de la clave 'clave1'
  print(mapa.length); // Imprime la longitud del mapa
}
