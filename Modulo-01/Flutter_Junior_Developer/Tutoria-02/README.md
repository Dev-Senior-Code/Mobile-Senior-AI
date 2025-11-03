# Tutoria 02: Programación en Dart: Estructuras, Clases y Modularización

## Descripción
En esta tutoría, exploraremos en profundidad los conceptos fundamentales de la programación en Dart. Aprenderás a trabajar con estructuras de datos como listas y mapas, comprenderás los principios de la Programación Orientada a Objetos (POO), y modularizarás tu código para proyectos más organizados y escalables. Este conocimiento es esencial para desarrollar aplicaciones robustas y mantenibles.

---

## Contenidos

### 1. Listas, Mapas, Funciones Anónimas y Lambdas

#### ¿Qué es una lista?
Una lista es una colección ordenada de elementos que pueden ser accedidos por su índice. Es útil para almacenar datos relacionados y realizar operaciones como agregar, eliminar o buscar elementos.

**Ejemplo práctico:**
```dart
List<String> frutas = ['Manzana', 'Banana', 'Cereza'];
frutas.add('Durazno');
print(frutas); // [Manzana, Banana, Cereza, Durazno]
```

#### ¿Qué es un mapa?
Un mapa es una estructura de datos que asocia claves únicas con valores. Es ideal para representar relaciones entre datos, como un diccionario.

**Ejemplo práctico:**
```dart
Map<String, int> inventario = {'Manzanas': 10, 'Naranjas': 5};
inventario['Peras'] = 7;
print(inventario); // {Manzanas: 10, Naranjas: 5, Peras: 7}
```

#### ¿Qué son las funciones anónimas y lambdas?
Son funciones sin nombre que se utilizan para realizar operaciones rápidas y concisas. Son especialmente útiles en operaciones como `map`, `filter` y `reduce`.

**Ejemplo práctico:**
```dart
List<int> numeros = [1, 2, 3, 4];
var cuadrados = numeros.map((n) => n * n).toList();
print(cuadrados); // [1, 4, 9, 16]
```

---

### 2. Introducción a POO en Dart: Clases, Atributos, Métodos

#### ¿Qué es una clase?
Una clase es una plantilla para crear objetos. Define las propiedades (atributos) y comportamientos (métodos) que los objetos de esa clase tendrán.

**Ejemplo práctico:**
```dart
class Persona {
  String nombre;
  int edad;

  Persona(this.nombre, this.edad);

  void saludar() {
    print('Hola, mi nombre es $nombre y tengo $edad años.');
  }
}

Persona p = Persona('Juan', 25);
p.saludar();
```

#### ¿Qué son los atributos y métodos?
- **Atributos**: Son las propiedades que describen un objeto (por ejemplo, `nombre` y `edad` en la clase `Persona`).
- **Métodos**: Son las funciones que definen el comportamiento del objeto (por ejemplo, `saludar`).

---

### 3. Constructores Nombrados y Opcionales

#### ¿Qué es un constructor?
Un constructor es un método especial que se utiliza para inicializar objetos de una clase. En Dart, puedes definir constructores personalizados para mayor flexibilidad.

**Ejemplo práctico:**
```dart
class Producto {
  String nombre;
  double precio;

  Producto({required this.nombre, this.precio = 0.0});
}

Producto p = Producto(nombre: 'Laptop', precio: 1500.0);
print(p.nombre); // Laptop
```

---

### 4. Modularización del Código: Archivos .dart, Import, Part y Part Of

#### ¿Qué es la modularización?
La modularización consiste en dividir el código en múltiples archivos para mejorar la organización, la legibilidad y la reutilización. En Dart, esto se logra mediante el uso de `import`, `part` y `part of`.

**Ejemplo práctico:**
1. **Archivo principal (`main.dart`)**:
   ```dart
   import 'models/producto.dart';

   void main() {
     Producto p = Producto(nombre: 'Laptop', precio: 1500.0);
     print(p.nombre);
   }
   ```

2. **Archivo de modelo (`models/producto.dart`)**:
   ```dart
   class Producto {
     String nombre;
     double precio;

     Producto({required this.nombre, this.precio = 0.0});
   }
   ```

---

### 5. Principios de Inmutabilidad con Final y Const

#### ¿Qué es la inmutabilidad?
La inmutabilidad garantiza que una vez que se asigna un valor, este no puede cambiar. Esto es útil para evitar errores y garantizar la consistencia en el código.

- **`final`**: Se asigna en tiempo de ejecución y no puede cambiar después.
- **`const`**: Se asigna en tiempo de compilación y no puede cambiar.

**Ejemplo práctico:**
```dart
final String nombre = 'Juan';
const double pi = 3.1416;
```

---

### 6. Buenas Prácticas: Organización de Carpetas, Separación de Lógica y Vista

#### ¿Por qué es importante?
Una buena organización del código facilita el mantenimiento, la colaboración y la escalabilidad del proyecto.

**Estructura recomendada:**
```
Tutoria-02/
├── main.dart
├── models/
│   └── producto.dart
├── services/
│   └── producto_service.dart
└── views/
    └── producto_view.dart
```


