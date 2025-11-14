# Modularización del Código en Dart

La **modularización del código** es la práctica de dividir un programa grande en partes más pequeñas e independientes, llamadas módulos. En Dart, esto se logra principalmente a través de archivos `.dart` y la directiva `import`. Sin embargo, las directivas `part` y `part of` ofrecen un mecanismo diferente para dividir una única biblioteca o clase.

## Objetivos de la Modularización

La división del código cumple varios propósitos cruciales en el desarrollo de software:

1.  **Mantenibilidad:** Es más fácil depurar, corregir y modificar pequeñas unidades de código que un único archivo grande.
2.  **Reutilización:** Permite crear clases y funciones independientes que pueden ser usadas en diferentes partes del proyecto o en proyectos futuros.
3.  **Organización:** Mejora la estructura del proyecto, agrupando código relacionado en directorios y archivos lógicos.
4.  **Colaboración:** Facilita el trabajo en equipo, ya que múltiples desarrolladores pueden trabajar en archivos distintos simultáneamente.

---

## El Archivo `.dart` y la Directiva `import`

En Dart, la unidad fundamental de modularización es la **biblioteca** (library), definida implícitamente por cada archivo `.dart`.

| Concepto | Propósito | Explicación |
| :---: | :---: | :--- |
| **Archivo `.dart`** | Unidad básica de una biblioteca. | Cada archivo `.dart` es una **biblioteca implícita** que encapsula y define su propio alcance (`scope`). Las funciones, clases y variables definidas en un archivo son privadas a él a menos que se use `import`. |
| **`import`** | Traer miembros de una biblioteca externa. | Permite acceder a las clases, funciones y variables **públicas** (que no comienzan con `_`) definidas en **otro archivo `.dart`**. |

### Cuadro de Diferencias en `import`

| Tipo de Importación | Sintaxis | Uso |
| :---: | :---: | :--- |
| **Importación de Archivo** | `import 'package:mi_app/models/producto.dart';` | Para importar un archivo dentro del mismo proyecto. |
| **Importación de Librería** | `import 'dart:io';` | Para importar librerías integradas del SDK de Dart. |
| **Importación con Alias** | `import 'dart:async' as async;` | Para resolver conflictos de nombres entre bibliotecas, usando un alias para prefijar los miembros (`async.Future`). |
| **Importación Parcial (`show`)** | `import 'dart:math' show max;` | Para importar **solo** los miembros especificados (ej. solo la función `max`). |
| **Importación de Exclusión (`hide`)** | `import 'dart:math' hide pi;` | Para importar **todo excepto** los miembros especificados (ej. importa todo menos la constante `pi`). |

### Ejemplo de `import`

```dart
// Archivo: models/producto.dart (Biblioteca 'producto')
class Producto {
  int id;
  // ...
}

// Archivo: services/inventario_service.dart (Biblioteca 'inventario')
import '../models/producto.dart'; // Importa la clase Producto

class InventarioService {
  List<Producto> productos = []; // Usa la clase importada
  // ...
}
```

# Las Directivas `part` y `part of`

Las directivas `part` y `part of` se utilizan para dividir el código de una única biblioteca grande en múltiples archivos. A diferencia de `import`, los archivos unidos con `part`/`part of` comparten el mismo ámbito (scope).

---

## Concepto

| **Directiva** | **Propósito** | **Explicación** |
|---------------|---------------|-----------------|
| **`part of`** | Define una parte de una biblioteca. | Se coloca en el archivo más pequeño para indicar que su código es parte de otra biblioteca. El código en este archivo puede acceder a los miembros privados (`_`) del archivo principal. |
| **`part`**    | Incluye un archivo parcial.         | Se coloca en el archivo principal (la biblioteca) para indicar que debe incluir el código del archivo parcial. |

---

##  Cuándo usar `part` vs `import`

| **Característica**            | **`import` (Modularización Estándar)** | **`part`/`part of` (Modularización Interna)** |
|--------------------------------|----------------------------------------|-----------------------------------------------|
| **Ámbito**                     | Crea su propio ámbito.                | Comparte el ámbito de la biblioteca principal. |
| **Acceso a Privados**          | No puede acceder a los miembros privados (`_`) de la otra biblioteca. | Sí puede acceder a los miembros privados (`_`) del otro archivo. |
| **Relación**                   | Relación entre dos bibliotecas diferentes. | Relación entre un archivo principal y sus fragmentos. |
| **Uso Común**                  | Separar clases, lógica y modelos en proyectos grandes. | Dividir una clase muy grande o un patrón de diseño como `freezed` o `mixin` en archivos separados. |

---

## Ejemplo de `part` y `part of`

Supongamos que tienes una clase muy grande `MotorVehiculo` y quieres dividir sus métodos en un archivo separado, pero quieres que sigan siendo parte de la misma clase.

### Dart

#### Archivo 1: `motor_vehiculo.dart` (La Biblioteca Principal)

```dart
library motor_vehiculo; // Opcional, pero define el nombre de la biblioteca.

class MotorVehiculo {
  // Miembro privado accesible por el archivo parcial
  int _velocidadActual = 0; 
  
  void arrancar() {
    print('Motor encendido.');
  }

  // Declara que una parte de esta clase está en otro archivo
  part 'movimiento.dart'; 
}

