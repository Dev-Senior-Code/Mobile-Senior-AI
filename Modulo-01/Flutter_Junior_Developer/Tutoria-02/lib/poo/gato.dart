class Gato {
  // Atributos
  String nombre;
  String raza;

  // Metodo especial (constructor)
  Gato(this.nombre, this.raza);

  // Metodo
  void maullar() {
    print('$nombre dice: ¡Miau!');
  }
}
