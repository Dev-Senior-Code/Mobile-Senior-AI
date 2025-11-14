import '../models/producto.dart';

class InventarioService {
  List<Producto> productos = [];

  void agregarProducto(Producto producto) {
    productos.add(producto);
    print('Creado: "${producto.nombre}" agregado.');
  }

  List<Producto> obtenerTodos() {
    return productos;
  }

  Producto? obtenerPorId(int id) {
    try {
      return productos.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  bool actualizarProducto(int id, String nuevoNombre, double nuevoPrecio) {
    Producto? productoAActualizar = obtenerPorId(id);

    if (productoAActualizar != null) {
      productoAActualizar.nombre = nuevoNombre;
      productoAActualizar.precio = nuevoPrecio;
      print('Actualizado: Producto ID $id modificado.');
      return true;
    }
    print('Error: Producto ID $id no encontrado para actualizar.');
    return false;
  }

  bool eliminarProducto(int id) {
    // 1. Contamos cuántos elementos hay ANTES de la operación.
    int elementosAntes = productos.length;

    // 2. Ejecutamos removeWhere. Esta función es VOID y hace el trabajo de eliminar.
    productos.removeWhere((p) => p.id == id);
    // ¡Asegúrate de que esta línea NO esté asignada a una variable!

    // 3. Contamos cuántos elementos hay DESPUÉS de la operación.
    int elementosDespues = productos.length;

    // 4. Determinamos si se eliminó algo (si la lista es más pequeña ahora).
    bool eliminado = elementosAntes > elementosDespues;

    if (eliminado) {
      print('Eliminado: Producto con ID $id borrado.');
    } else {
      print('Error: Producto con ID $id no se encontró.');
    }

    return eliminado; // Retorna el valor bool basado en el conteo.
  }
}
