# Ejercicios por Niveles

## Nivel 1: Fundamentos y Declaración de Variables

### Ejercicio 1.1: Perfil de Usuario Básico (Variables y Tipos)

**Escenario Real**: Estás creando el formulario inicial de registro para una aplicación de red social.

| **Variable**       | **Tipo de Dato** | **Requisito de Inicialización**                                      |
|---------------------|------------------|----------------------------------------------------------------------|
| `nombreCompleto`    | `String`        | Debe ser una variable mutable (cambiable).                          |
| `edad`              | `int`           | Debe ser una variable inmutable (`final`), asignada inmediatamente. |
| `estaVerificado`    | `bool`          | Debe ser una constante de compilación (`const`).                    |
| `saldoCuenta`       | `double`        | Debe ser una variable mutable con valor inicial `0.0`.              |

**Instrucción**:  
Declara las cuatro variables respetando las palabras clave (`var`, `final`, `const`) y los tipos especificados. Luego:  
1. Intenta cambiar el valor de `nombreCompleto`.  
2. Comprueba el error al intentar cambiar `edad`.

---

## Nivel 2: Estructuras de Datos Básicas (`List` y `Map`)

### Ejercicio 2.1: Gestión de Tareas Pendientes (`List`)

**Escenario Real**: Simular una lista de tareas (To-Do List) en una aplicación.

1. Crea una `List` de tipo `String` llamada `listaTareas`.
2. **Agregar**: Añade las siguientes tareas a la lista:  
   - "Comprar víveres"  
   - "Revisar código"  
   - "Planificar sprint"
3. **Acceder**: Imprime la primera tarea de la lista.
4. **Actualizar**: La segunda tarea es incorrecta, cámbiala a "Depurar módulo de pago".
5. **Eliminar**: Elimina la tarea "Comprar víveres".
6. **Verificación**: Usa la propiedad `length` para imprimir cuántas tareas quedan.

---

### Ejercicio 2.2: Configuración de Entorno (`Map`)

**Escenario Real**: Cargar un archivo de configuración de entorno (variables clave-valor).

1. Crea un `Map` llamado `configuracion` donde:  
   - La clave sea `String`.  
   - El valor sea `dynamic` (ya que puede ser un número o una cadena).
2. Añade las siguientes entradas:  
   - `'API_KEY': 'xyz123abc'` (`String`)  
   - `'TIMEOUT_SECS': 30` (`int`)  
   - `'DEBUG_MODE': true` (`bool`)
3. **Acceder**: Imprime el valor de `API_KEY`.
4. **Actualizar**: Modifica el valor de `TIMEOUT_SECS` a `60`.
5. **Verificación**: Usa el método `containsKey()` para verificar si la configuración incluye la clave `'LOG_LEVEL'` e imprime el resultado.

---

## Nivel 3: POO Básico (Clases, Atributos y Métodos)

### Ejercicio 3.1: Modelo de Producto (Clase y Constructor)

**Escenario Real**: Definir el modelo de datos para un ítem en una tienda en línea.

1. Crea una clase llamada `Item`.
2. Define los siguientes atributos `final` (inmutables) en el cuerpo de la clase:  
   - `sku` (`String`)  
   - `nombre` (`String`)  
   - `precio` (`double`)
3. Crea un constructor conciso para inicializar estos tres atributos inmediatamente.
4. Añade un método llamado `descuento(double porcentaje)` que:  
   - Recibe el porcentaje de descuento (ej. `0.10` para 10%).  
   - Retorna el precio final después de aplicar el descuento.

**Implementación**:  
1. Crea una instancia de `Item`:  
   - `"Laptop X1"`, SKU `"LPT001"`, `$1500.00`.
2. Imprime el precio final al aplicar un 15% de descuento.

---

## Nivel 4: POO Avanzado (Encapsulamiento y Herencia)

### Ejercicio 4.1: Sistema de Autenticación (Encapsulamiento)

**Escenario Real**: Proteger la contraseña de un usuario para que no pueda ser accedida ni modificada directamente.

1. Crea una clase llamada `Usuario`.
2. Define:  
   - Un atributo privado (`_`) llamado `_contrasenaHash` (`String`).  
   - Un atributo público `email` (`String`).
3. Crea un constructor para inicializar `email` y `_contrasenaHash`.
4. Implementa:  
   - Un **Getter** (`get`) llamado `puedeAcceder` que retorna `true` si `_contrasenaHash` no está vacío.  
   - Un **Setter** (`set`) llamado `nuevaContrasena` que solo actualiza `_contrasenaHash` si la nueva contraseña tiene más de 8 caracteres.

**Implementación**:  
1. Crea una instancia de `Usuario`.  
2. Intenta acceder directamente a `_contrasenaHash` (debería dar error de compilación).  
3. Usa el setter `nuevaContrasena` con:  
   - Una cadena corta (ej. `"123"`).  
   - Una cadena larga (ej. `"MiClaveSuperSegura1"`).  
4. Imprime el valor de `puedeAcceder`.

---

### Ejercicio 4.2: Componentes Web (Herencia y Polimorfismo)

**Escenario Real**: Diseñar una jerarquía de componentes reutilizables en una interfaz de usuario.

1. Crea una clase abstracta llamada `ComponenteWeb` con:  
   - Un atributo `id` (`String`).  
   - Un método abstracto llamado `renderizar()`.
2. Crea una clase llamada `Boton` que extienda (`extends`) de `ComponenteWeb`.  
   - Añade un atributo propio: `texto` (`String`).  
   - Implementa el método `renderizar()` para que imprima:  
     `"Renderizando Botón ID [id] con texto: [texto]"`.
3. Crea una clase llamada `InputTexto` que extienda de `ComponenteWeb`.  
   - Añade un atributo propio: `placeholder` (`String`).  
   - Implementa el método `renderizar()` para que imprima:  
     `"Renderizando Input ID [id] con placeholder: [placeholder]"`.

**Polimorfismo**:  
1. Crea una `List<ComponenteWeb>` (lista polimórfica) que contenga instancias de `Boton` e `InputTexto`.  
2. Itera sobre la lista y llama al método `renderizar()` en cada elemento. (Cada objeto ejecutará su propia versión del método).