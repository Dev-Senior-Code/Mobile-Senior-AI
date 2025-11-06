import 'gato.dart';

void main() {
  var miGato = Gato('Marcelo', 'Siames');
  print('Mi gato se llama ${miGato.nombre} y es de raza ${miGato.raza}');
  miGato.maullar();
}
