import 'dart:io';

/// Punto de entrada principal de la aplicación.
/// Imprime un mensaje de bienvenida en la consola
/// y solicita el nombre del usuario para saludarlo.

void main() {
  print('Ingrese su nombre:');
  String? nombre = stdin
      .readLineSync(); // Lee la entrada del usuario por consola y la almacena en la variable 'nombre'.
  print('Hola $nombre, Bienvenido al curso de Mobile Senior AI!');
}
