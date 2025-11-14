import '../services/inventario_service.dart';
import '../models/producto.dart';
import 'dart:io';

void mostrarMenu() {
  print('\n----------------------------------------');
  print('          MENÚ DE INVENTARIO CRUD         ');
  print('----------------------------------------');
  print('1. Crear Producto (CREATE)');
  print('2. Listar Todos (READ)');
  print('3. Buscar por ID (READ)');
  print('4. Actualizar Producto (UPDATE)');
  print('5. Eliminar Producto (DELETE)');
  print('0. Salir');
  print('----------------------------------------');
  stdout.write('Seleccione una opción: ');
}

void main() {
  var inventario = new InventarioService();
  bool salir = false;

  while (!salir) {
    mostrarMenu();

    // Leemos la opción del usuario desde la consola
    String? entrada = stdin.readLineSync();
    int? opcion = int.tryParse(entrada ?? '');

    // El switch dirige la lógica del programa
    switch (opcion) {
      case 1: // CREATE
        stdout.write('Ingrese ID (entero): ');
        int id = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        stdout.write('Ingrese Nombre: ');
        String nombre = stdin.readLineSync() ?? 'Nuevo Producto';

        stdout.write('Ingrese Precio (decimal): ');
        double precio = double.tryParse(stdin.readLineSync() ?? '0.0') ?? 0.0;

        inventario.agregarProducto(Producto(id, nombre, precio));
        break;

      case 2: // READ (Todos)
        print('\n--- LISTA DE PRODUCTOS ---');
        var productos = inventario.obtenerTodos();
        if (productos.isEmpty) {
          print('El inventario está vacío.');
        } else {
          productos.forEach(print); // Imprimimos los productos
        }
        break;

      case 3: // READ (Por ID)
        stdout.write('Ingrese el ID a buscar: ');
        int idBuscar = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        Producto? producto = inventario.obtenerPorId(idBuscar);
        if (producto != null) {
          print('Producto Encontrado: $producto');
        } else {
          print('Producto con ID $idBuscar no se encontró.');
        }
        break;

      case 4: // UPDATE
        stdout.write('Ingrese el ID del producto a actualizar: ');
        int idActualizar = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        stdout.write('Ingrese Nuevo Nombre: ');
        String nuevoNombre = stdin.readLineSync() ?? '';

        stdout.write('Ingrese Nuevo Precio: ');
        double nuevoPrecio =
            double.tryParse(stdin.readLineSync() ?? '0.0') ?? 0.0;

        inventario.actualizarProducto(idActualizar, nuevoNombre, nuevoPrecio);
        break;

      case 5: // DELETE
        stdout.write('Ingrese el ID del producto a eliminar: ');
        int idEliminar = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        inventario.eliminarProducto(idEliminar);
        break;

      case 0: // Salir
        salir = true;
        print(' Saliendo del sistema de inventario. ¡Hasta pronto!');
        break;

      default: // Opción inválida
        print(' Opción inválida. Por favor, ingrese un número del 0 al 5.');
        break;
    }
  }
}
