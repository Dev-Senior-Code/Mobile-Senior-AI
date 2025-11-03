/// Punto de entrada principal de la aplicación.
/// Imprime un mensaje de bienvenida en la consola.
void main() {
  print('¡Hola, Bienvenidos al curso de Mobile Senior AI!');
  saludar('Andres'); // Llamada a la función saludar
  sumar(5, 3); // Llamada a la función sumar
}

/// Imprime un saludo personalizado en la consola.
void saludar(String nombre) {
  print('¡Hola, $nombre! Bienvenido al curso de Mobile Senior AI!');
}

/// Suma dos enteros y los imprime en la consola.
///
/// Recibe dos enteros [a] y [b] como parámetros y los suma.
/// El resultado de la suma se imprime en la consola precedido
/// por un mensaje que indica la suma de ambos números.
///
/// Ejemplo de uso:
/// sumar(5, 3);
///
void sumar(int a, int b) {
  int resultado = a + b;
  print('La suma de $a y $b es: $resultado');
}
