void main() {
  List<dynamic> frutas = ['Mango', 'Manzana', 'Banana', 1, true, 2.0];

  // var listaDinamica = <bool>[false];

  frutas.add('Durazno');
  frutas.insert(1, 'Pera');
  frutas.remove('Banana');
  frutas.removeAt(0);
  frutas[0] = 'Kiwi';
  print(frutas);
  print(frutas.length);
}
