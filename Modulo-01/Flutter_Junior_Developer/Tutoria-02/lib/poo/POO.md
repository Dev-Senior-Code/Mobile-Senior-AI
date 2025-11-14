# Programación Orientada a Objetos (POO) en Dart 

La POO es el paradigma de diseño que modela el mundo real en el código, utilizando "objetos" que combinan datos (propiedades) y comportamiento (métodos). En Dart, este enfoque es obligatorio, ya que **todo es un objeto** que hereda de la clase base `Object`.

---

## 1. Clases, Objetos y Constructores

Una **Clase** es el *plano* o la *plantilla* que define la estructura del objeto. Un **Objeto** es la *instancia* concreta de esa clase en la memoria.

Estos tres términos son fundamentales y a menudo se usan incorrectamente como sinónimos. En el contexto de la Programación Orientada a Objetos (POO), definen la relación entre la definición de un tipo de dato y su materialización en la memoria de la computadora.

---

## Clase (Class)

Una **Clase** es la **plantilla**, el **plano** o la **definición abstracta** de un tipo de dato.

* **Definición:** Es un constructo lógico que define un conjunto de propiedades (atributos o datos) y un conjunto de comportamientos (métodos o funciones) que todos los objetos creados a partir de ella poseerán.
* **Existe en...:** El código fuente (el archivo `.dart`).
* **En la Memoria:** No ocupa espacio en la memoria RAM por sí misma; es solo una instrucción para el compilador.
* **En Dart:** Se define con la palabra clave `class`.

### Ejemplo de Clase

```dart
class Gato {
  // Propiedades (atributos)
  String nombre = 'Sin Nombre';
  int edad = 0;

  // Comportamiento (método)
  void maullar() {
    print('$nombre dice ¡Miau!');
  }
}
```

## Objeto (Object) / Instancia (Instance)

En la práctica de Dart y muchos lenguajes, los términos **Objeto** e **Instancia** se usan indistintamente para referirse a la misma cosa: la materialización de la Clase.

---

## Objeto: La Entidad Concreta

Un **Objeto** es una entidad concreta en el programa que se crea a partir de una Clase.

- **Definición**: Es el resultado de seguir el plano definido por la Clase. Cada objeto tiene su propia copia de las propiedades (datos).
- **Existe en...**: La memoria de la computadora (RAM), mientras el programa se está ejecutando.
- **En la Memoria**: Ocupa espacio para almacenar sus valores internos (nombre, edad, etc.).

---

### Instancia: El Acto de Creación

Una **Instancia** es el acto de creación de ese objeto en la memoria. Decimos que se "instancia" un objeto.

- **En Dart**: La creación se realiza usando la palabra clave `new` (opcionalmente) y el constructor de la clase.

---

### Ejemplo de Objeto/Instancia

```dart
// Creamos una instancia (objeto) de la clase Gato
// 'gato1' es la referencia al objeto en memoria
var gato1 = Gato(); 
gato1.nombre = 'Michi'; // 'Michi' es el valor de ESTE objeto
gato1.edad = 3; 

// Creamos OTRA instancia (otro objeto) de la misma clase
var gato2 = Gato();
gato2.nombre = 'Luna'; // 'Luna' es el valor de ESTE SEGUNDO objeto
gato2.edad = 1; 

// Cada objeto tiene sus propios datos y usa el mismo comportamiento
gato1.maullar(); // Salida: Michi dice ¡Miau!
gato2.maullar(); // Salida: Luna dice ¡Miau!
```

###  Resumen de la Relación

| **Término**   | **Analogía**                | **Propósito en el Código**                              |
|---------------|-----------------------------|--------------------------------------------------------|
| **CLASE**     | El plano de una casa        | Define qué es y qué hace el objeto (la estructura).    |
| **INSTANCIA** | El acto de construir la casa| El proceso de creación en la memoria.                  |
| **OBJETO**    | La casa física y terminada  | La entidad existente en la memoria que contiene datos. |

## 1.1. Constructores Nombrados y Const

**¿Por qué son importantes para el código senior?**
Los constructores normales solo permiten una forma de inicializar la clase. Los **Constructores Nombrados** y **`const`** son herramientas de optimización y claridad en la intención.

| Tipo de Constructor | Palabra Clave | Uso Profesional |
| :---: | :---: | :--- |
| **Nombrado** | `Clase.nombre(...)` | Útil para métodos de inicialización alternativos como `User.fromJson(Map<String, dynamic> json)` o `Settings.withDefaults()`. |
| **Constante** | `const` | Se usa para crear objetos **inmutables** en **tiempo de compilación**. Si inicializas dos variables `const`, Dart apunta a la misma ubicación en memoria, lo que es crucial para la optimización de widgets en Flutter. |
| **Factory** | `factory` | Permite lógica de inicialización compleja. Un constructor `factory` **no tiene que crear una nueva instancia**; puede devolver una instancia existente (patrón Singleton) o una subclase basada en condiciones. |

**Ejemplo de Factory para Patrón Singleton (Optimización):**
```dart
class DatabaseManager {
  // 1. Instancia privada estática
  static final DatabaseManager _instance = DatabaseManager._internal();

  // 2. Constructor de factory
  factory DatabaseManager() {
    return _instance; // Siempre devuelve la misma instancia
  }

  // 3. Constructor privado (no permite que otros lo llamen directamente)
  DatabaseManager._internal(); 

  void connect() => print("Conectado a la base de datos única.");
}
```
# 2. Encapsulamiento: La Regla de la Privacidad

El **encapsulamiento** es el pilar que protege el estado interno de un objeto, limitando el acceso directo a sus datos. En Dart, el encapsulamiento se logra a nivel de **biblioteca** (archivo), no de clase.

---

## 2.1. El Prefijo `_` (Underscore)

En Dart, no existe `public`, `private` o `protected`. Para hacer un miembro privado, se antepone un **underscore** (`_`).

- **Alcance del Privado**: Un miembro `_privado` solo es accesible dentro del mismo archivo `.dart` (la misma biblioteca).

---

## 2.2. Getters y Setters

Se utilizan para controlar de forma explícita cómo se puede leer (`get`) o escribir (`set`) un campo privado.

### Ejemplo en Dart

```dart
class Usuario {
  String _correo = ''; // Campo privado

  // Getter: Expone el correo de forma controlada (sólo lectura)
  String get correoPublico {
    // Se puede aplicar lógica antes de devolver
    return 'Usuario: $_correo';
  }

  // Setter: Controla la forma en que se actualiza el campo
  set actualizarCorreo(String nuevoCorreo) {
    if (nuevoCorreo.contains('@') && nuevoCorreo.endsWith('.com')) {
      _correo = nuevoCorreo;
    } else {
      throw FormatException("Formato de correo inválido.");
    }
  }
}
```
> ### Objetivo Senior 
> - Usar **Getters** y **Setters** para implementar reglas de validación (como en el ejemplo anterior).
> - Proteger la **invariancia del objeto**: Asegurar que el estado interno sea siempre válido.


# 3. Herencia y Abstracción

La **herencia** (`extends`) define una relación "es un" (ej. **Perro es un Animal**).  
La **abstracción** define un "qué hacer" sin especificar el "cómo".

---

## 3.1. Clases Abstractas (`abstract class`)

Una **clase abstracta** es un contrato parcial. Puede contener:

- **Métodos concretos**: Con cuerpo, que son heredados directamente.
- **Métodos abstractos**: Sin cuerpo, que obligan a las clases hijas a implementarlos (`@override`).

---

### Implementación y Objetivo

#### Ejemplo en Dart

```dart
abstract class Notificador {
  // Atributo concreto: se hereda
  final String canal; 
  Notificador(this.canal);

  // Método abstracto: OBLIGA a implementarse
  void enviar(String mensaje); 

  // Método concreto: se hereda
  void log() => print('Mensaje enviado por $canal');
}

class EmailNotificador extends Notificador {
  EmailNotificador() : super('Email');

  @override
  void enviar(String mensaje) {
    // Lógica específica de EMAIL
    print('Enviando email: $mensaje');
  }
}
```

> ### Objetivo Senior
> - Usar **clases abstractas** para crear la arquitectura del dominio de la aplicación.
> - Definir la funcionalidad base compartida por todas las entidades similares.

# 4. Polimorfismo e Interfaces

El **Polimorfismo** (muchas formas) permite que un solo tipo de dato o método actúe de manera diferente según el contexto o el objeto que lo invoca.

---

## 4.1. Polimorfismo por Anulación (`@override`)

Es el más común, visto en la herencia, donde una subclase implementa un método de su superclase de manera única.

---

## 4.2. Interfaces (`implements`)

En Dart, una **interfaz** es un contrato total. Si una clase implementa otra (`implements`), está obligada a reescribir todos y cada uno de los métodos y propiedades definidos en la interfaz.

---

### Implementación y Objetivo

#### Ejemplo en Dart

```dart
// Clase que actúa como interfaz (Contrato)
class Persistencia {
  void guardar(data);
  dynamic leer(id);
}

class LocalStorage implements Persistencia {
  @override
  void guardar(data) {
    // Guarda en SharedPreferences / Hive / etc.
    print('Guardando localmente...');
  }

  @override
  dynamic leer(id) {
    // Lee desde el almacenamiento local
    return {'data': 'local'};
  }
}
```
> ### Objetivo Senior (Patrón de Repositorio)
>- Usar **`implements`** para el **Patrón Repositorio**.  
>- Esto separa la definición del contrato (`Persistencia`) de su implementación (`LocalStorage`).  
>- Si decides cambiar la implementación a una API REST, solo necesitas crear `ApiRepository implements Persistencia`, y el resto de la aplicación que use `Persistencia` no necesita cambiar.

# 5. Mixins (`with`): El Mecanismo de Reutilización

Los **Mixins** son una forma poderosa de reutilizar código de clase en múltiples jerarquías de herencia, abordando la limitación de Dart de la **herencia simple**.

---

## Uso y Objetivo Senior

Un **Mixin** no define una relación "es un" (herencia), sino una relación "tiene la capacidad de".

| **Concepto**       | **Relación**          | **Palabra Clave** | **Uso**                                                                 |
|---------------------|-----------------------|-------------------|-------------------------------------------------------------------------|
| **Clase Abstracta** | "es un"              | `extends`         | Compartir código base y obligar a implementar métodos.                 |
| **Mixin**           | "tiene la capacidad de" | `with`            | Inyectar métodos y propiedades en clases dispares (ej. `Serializable`, `Logeable`). |

---

### Ejemplo en Dart

```dart
// Mixin para añadir un contador de uso
mixin Usable {
  int _contador = 0;

  void usar() {
    _contador++;
    print('Usado: $_contador veces');
  }
}

// Clase sin relación de herencia con otra
class Boton with Usable {
  void click() {
    usar(); // Usa el método inyectado por el Mixin
  }
}

class RecursoExterno with Usable {
  void acceder() {
    usar();
  }
}
```
>### Objetivo Senior
>- Reducir la duplicación de código (**DRY**) y evitar la complejidad de la herencia profunda.  
>- Los **Mixins** son omnipresentes en Flutter (ej. `State<T> with TickerProviderStateMixin`).