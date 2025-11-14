class Producto {
  // Atributos
  int id;
  String nombre;
  double precio;

  // Contructor
  Producto(this.id, this.nombre, this.precio);

  @override
  String toString() {
    return 'ID: $id | Nombre: $nombre | Precio:  ${precio.toStringAsFixed(3)}'; // toStringAsFixed(3) redondea a cantidad de decimales en este caso 3
  }
}
