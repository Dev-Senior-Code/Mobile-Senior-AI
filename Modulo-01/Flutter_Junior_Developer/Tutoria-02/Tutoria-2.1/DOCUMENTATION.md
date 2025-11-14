#  Explicación de la Sintaxis Clave en Dart 

Este documento detalla las partes de sintaxis y operadores específicos del lenguaje Dart utilizados en el proyecto de consola del CRUD de inventario y amplía con funciones de I/O adicionales.

##  Modificadores y Operadores de Nulabilidad (Null Safety)

Dart utiliza estos operadores para manejar variables que pueden ser **`null`**, lo cual es una característica central conocida como *Null Safety*.

| Sintaxis | Nombre | Propósito y Uso en el Código | Ejemplo del Código |
| :---: | :---: | :--- | :--- |
| **`?`** | **Operador de Tipo Nulo (*Nullable Type*)** | Se coloca después de un tipo (`String?`, `int?`) para indicar que la variable *puede* contener un valor del tipo especificado **o** el valor **`null`**. Es obligatorio usarlo si la variable no se inicializa inmediatamente y puede recibir `null`. | `String? entrada = stdin.readLineSync();` |
| **`??`** | **Operador de Fusión Nula (*Null Coalescing*)** | Proporciona un **valor predeterminado** si la expresión a su izquierda es `null`. Es una forma concisa de manejar valores opcionales. | `int? opcion = int.tryParse(entrada ?? '');` |
| **`!`** | **Operador de Aserto No Nulo (*Non-Null Assertion*)** | Le dice al compilador que confíe en el programador: **"Sé que este valor no es `null` aquí, así que trátalo como no nulo."** Se usa para deshabilitar el *null safety* en un punto específico. | No se usa explícitamente en el `main.dart` del switch. |



##  Funciones de Entrada/Salida de Consola (`dart:io`)

Las siguientes partes se utilizan para interactuar con el usuario a través de la línea de comandos.

| Sintaxis | Origen | Propósito y Uso en el Código | Ejemplo del Código |
| :---: | :---: | :--- | :--- |
| **`import 'dart:io';`** | **Directiva** | Importa la librería estándar de Dart que permite la entrada y salida de datos (Input/Output) a través del sistema operativo, esencial para aplicaciones de consola. | `import 'dart:io';` |
| **`stdout.write(...)`** | **`dart:io`** | **Salida estándar**. Se utiliza para imprimir texto en la consola **sin un salto de línea** al final. | `stdout.write('Seleccione una opción: ');` |
| **`print(...)`** | **Función global** | Imprime el objeto en la consola y **añade automáticamente un salto de línea** al final. | `print('--- LISTA DE PRODUCTOS ---');` |
| **`stdin.readLineSync()`** | **`dart:io`** | **Entrada estándar**. Espera y lee una línea de texto completa ingresada por el usuario. Retorna un `String?`. | `String? entrada = stdin.readLineSync();` |



##  Más Funciones Comunes de Entrada/Salida Avanzada (`dart:io`)

Estas funciones son esenciales cuando se trabaja con **archivos** o se necesita **manejar I/O asíncrona** (que no bloquea el resto del programa).

| Sintaxis | Clase/Función | Propósito y Uso | Ejemplo (Conceptual) |
| :---: | :---: | :--- | :--- |
| **`File(...)`** | **Clase** | Crea una referencia a un archivo en el sistema de archivos. Se usa para operaciones de lectura/escritura. | `var file = File('datos.txt');` |
| **`file.writeAsStringSync(...)`** | **Método** | Escribe una cadena de texto en un archivo de forma **síncrona** (bloqueante). | `file.writeAsStringSync('Hola mundo');` |
| **`await file.writeAsString(...)`** | **Método (Async)** | Escribe una cadena de texto en un archivo de forma **asíncrona** (no bloqueante), ideal para evitar congelar la UI. Requiere usar `async` y `await`. | `await file.writeAsString(json);` |
| **`file.readAsStringSync()`** | **Método** | Lee todo el contenido de un archivo como una cadena de texto de forma **síncrona**. | `String contenido = file.readAsStringSync();` |
| **`await file.readAsLines()`** | **Método (Async)** | Lee el contenido de un archivo y lo retorna como una lista de cadenas, donde cada elemento es una línea del archivo, de forma **asíncrona**. | `List<String> lineas = await file.readAsLines();` |

---

##  Conversión de Datos y Manejo de Errores

| Sintaxis | Tipo | Propósito y Uso en el Código | Ejemplo del Código |
| :---: | :---: | :--- | :--- |
| **`int.tryParse(...)`** | **Función Estática** | Intenta convertir una cadena de texto (`String`) en un número **entero (`int`)**. Si falla, **retorna `null`** en lugar de lanzar una excepción. | `int? opcion = int.tryParse(entrada ?? '');` |
| **`double.tryParse(...)`** | **Función Estática** | Intenta convertir una cadena de texto (`String`) en un número de **punto flotante (`double`)**. Si falla, **retorna `null`**. | `double precio = double.tryParse(stdin.readLineSync() ?? '0.0') ?? 0.0;` |

### Ejemplo de Conversión Anidada (Cadena de Seguridad)

La línea de conversión de precio utiliza dos operadores `??` para garantizar un valor numérico seguro:

```dart
double nuevoPrecio = double.tryParse(stdin.readLineSync() ?? '0.0') ?? 0.0;
```
---


#  Manejo de Excepciones en Dart: El Bloque `try-catch`

El bloque `try-catch` es la herramienta fundamental en Dart (y en muchos lenguajes de programación) para manejar **errores en tiempo de ejecución**, conocidos como **excepciones**. Su objetivo es permitir que un programa se recupere de un fallo inesperado sin detener su ejecución bruscamente.

---

##  Objetivo Principal del `try-catch`

El principal objetivo es la **resiliencia** y el **manejo elegante de fallos**.

1.  **Evitar la Caída del Programa (Crash):** Cuando ocurre una excepción (como intentar dividir por cero o buscar un elemento inexistente), el flujo normal del programa se interrumpe. **`try-catch`** "atrapa" ese error y evita que el programa termine.
2.  **Proporcionar Retroalimentación Útil:** Permite informar al usuario o registrar la naturaleza del problema de una manera controlada (ej. "El producto no fue encontrado") en lugar de mostrar un error técnico críptico (ej. `StateError: No element`).
3.  **Ejecutar Limpieza (`finally`):** El bloque `finally` garantiza que ciertas operaciones (como cerrar una conexión a una base de datos o un archivo) se ejecuten, haya ocurrido un error o no.

---

##  Estructura y Componentes

El manejo de excepciones en Dart se realiza con la siguiente estructura. Las secciones `on`, `catch` y `finally` son opcionales, pero se debe usar al menos un `catch` o un `on`.

```dart
try {
  // 1. Código propenso a errores.
} on ExcepcionEspecifica {
  // 2. Maneja solo un tipo específico de error.
} catch (e, s) {
  // 3. Maneja CUALQUIER otra excepción.
  //    e: La excepción (objeto de error).
  //    s: El stack trace (la secuencia de llamadas que llevó al error).
} finally {
  // 4. Código que se ejecuta SIEMPRE, haya error o no.
}
```

# Explicación de las Partes

| **Componente** | **Descripción** |
|-----------------|-----------------|
| **try**         | Contiene el código que se quiere proteger. Si una excepción ocurre aquí, el control salta inmediatamente a la sección `catch` o `on`. |
| **on**          | Permite manejar un tipo de excepción específico (ej. `on FormatException`). Útil para errores que se pueden manejar de forma diferente. |
| **catch (e, s)**| Atrapa cualquier excepción que no fue manejada por un `on` anterior. `e` es la instancia del objeto de error, y `s` es el stack trace, crucial para la depuración. |
| **finally**     | El código en este bloque siempre se ejecuta al finalizar el bloque `try-catch`, independientemente de si hubo un error o si este fue manejado. Ideal para liberar recursos. |

---

## Ejemplo Práctico (Del `InventarioService`)

En el método `obtenerPorId`, se usa `try-catch` para evitar que el programa falle si no encuentra un producto:

```dart
Producto? obtenerPorId(int id) {
  try {
    // Si no encuentra el producto, firstWhere lanza una excepción 'StateError'.
    return productos.firstWhere((p) => p.id == id);
  } catch (e) {
    // Captura el error.
    return null; // En lugar de crashear, retorna null de forma controlada.
  }
}
```

# ¿Por Qué Usarlo y Por Qué No Usarlo?

##  Cuándo se DEBE usar `try-catch`:

1. **Interacción con Entidades Externas**:  
   Al interactuar con el sistema de archivos (I/O), redes (HTTP), o bases de datos. Estos sistemas son inherentemente inestables y propensos a errores (ej. "archivo no encontrado", "conexión perdida").

2. **Lógica de Negocio que Puede Fallar**:  
   En casos donde, por diseño, una búsqueda o una operación podría no tener un resultado válido.

3. **Recursos Críticos (`finally`)**:  
   Cuando necesitas asegurarte de que un recurso abierto (como una conexión) se cierre de forma segura, incluso si el proceso falla.

---

##  Cuándo NO se DEBE usar `try-catch`:

1. **Para Controlar el Flujo Normal**:  
   Nunca debe usarse como alternativa a la lógica condicional (`if-else`).  
   Ejemplo: Si sabes que una lista puede estar vacía, verifica con `if (productos.isEmpty)` en lugar de esperar a que la lista lance un error y luego atraparlo.  
   > El manejo de excepciones es costoso en rendimiento.

2. **Errores del Programador (Bugs Lógicos)**:  
   Los errores lógicos (ej. una variable `null` donde se espera un valor) deberían ser corregidos durante el desarrollo, no enmascarados con un `try-catch` genérico.

3. **Capturar Genéricamente sin Manejar (`catch (e) {}`)**:  
   Capturar un error y dejar el bloque vacío es un antipatrón. Esto esconde problemas graves y hace que la depuración sea casi imposible.  
   > Si atrapas un error, ¡debes manejarlo (registrarlo, reportarlo o informarlo al usuario)!
