void main() {
  //Creamos una lista de strings
  List<String> frutas = ['Manzana', 'Pera', 'Uva'];
  print(frutas); // Imprime el contenido de la lista
  print(frutas[0]); // Imprime el primer elemento de la lista
  print(frutas.length); // Imprime la longitud de la lista

  //Creamos una lista de enteros
  List<int> numeros = [1, 2, 3, 4, 5];
  print(numeros);

  //Creamos una lista de doubles
  List<double> decimales = [1.1, 2.2, 3.3];
  print(decimales);

  //Creamos una lista de booleans
  List<bool> booleanos = [true, false, true];
  print(booleanos);

  //Creamos una lista de listas
  List<List<int>> matrices = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];
  print(matrices);

  imprimirLista(
    frutas,
  ); // Llamamos a la funcion imprimirLista para imprimir la lista de frutas
}

// Creamos una funcion para imprimir la lista
void imprimirLista(List<String> lista) {
  for (String elemento in lista) {
    print(elemento);
  }
}
