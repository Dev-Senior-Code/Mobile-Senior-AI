#  Buenas Prácticas de Organización y Estructura en Proyectos Dart/Flutter

Adoptar una estructura de carpetas y una clara separación de responsabilidades eleva la calidad del código, haciéndolo escalable y mantenible.

---

##  Organización Profesional de Carpetas

Una estructura de carpetas lógica es el primer paso hacia un código de nivel senior. El objetivo es que cualquier desarrollador pueda encontrar cualquier archivo en segundos.

### Estructura Base Sugerida

Generalmente, los archivos Dart residen dentro de la carpeta `lib`. La siguiente estructura es un estándar ampliamente aceptado:

# Estructura de Carpetas

```plaintext
lib/
├── main.dart       // Punto de entrada del programa.
├── src/            // Contiene todo el código funcional del proyecto.
│   ├── core/       // Servicios y utilidades genéricas.
│   ├── features/   // (Opción A: Por Funcionalidad) Agrupa por característica de la app.
│   └── shared/     // (Opción B: Por Tipo) Widgets, Modelos, Servicios compartidos.
└── utils/          // Archivos de ayuda y extensiones (no clases).
```

### Detalle de Carpetas Comunes

| Carpeta | Contenido | Responsabilidad (¿Qué hace?) |
| :---: | :---: | :--- |
| **`features`** | `auth/`, `products/`, `profile/` | **Agrupación por Módulo.** Cada subcarpeta contiene la lógica, modelos, vistas y estados relacionados solo con esa característica. (Método Preferido) |
| **`models`** | `user_model.dart`, `product.dart` | **Datos.** Definiciones de clases (POCOs) para la estructura de la información (JSON, base de datos, etc.). |
| **`services`** | `auth_service.dart`, `api_service.dart` | **Lógica Externa/Conexiones.** Manejan la comunicación con APIs, bases de datos, almacenamiento local o el sistema operativo. |
| **`views`** | `home_screen.dart`, `login_page.dart` | **Interfaz de Usuario (UI).** Los *Screens* o *Pages* que contienen la estructura de la interfaz (scaffold, columnas, etc.). |
| **`widgets`** | `custom_button.dart`, `card_item.dart` | **Componentes Reutilizables.** Piezas de UI que se usan en múltiples vistas. |
| **`utils`** | `constants.dart`, `validators.dart` | **Ayudantes Genéricos.** Constantes, extensiones, funciones de validación, formateadores. |

---

##  Separación de Lógica y Vista (Patrones de Diseño)

El error más común en código junior es mezclar la lógica de negocio (cómo se obtienen y procesan los datos) con la vista (cómo se muestran los datos). Un código profesional **separa estrictamente** estos dos aspectos.

### Lo que NO se debe hacer (Antipatrón)

* **Lógica en el `build`:** Realizar llamadas a la API o complejas transformaciones de datos directamente dentro del método `build` de un `Widget`.
* **Múltiples Responsabilidades:** Una única clase manejando la UI, el estado, la conexión a la base de datos y la navegación.

### Buenas Prácticas (Patrones Seniores)

Se utilizan Patrones de Manejo de Estado para crear una capa intermedia:

| Capa | Responsabilidad | Ejemplo de Patrón (Flutter) |
| :---: | :---: | :--- |
| **1. VISTA (`Views`/`Widgets`)** | **Visualización.** Recibe los datos, los pinta, y envía las acciones del usuario (ej. `onPressed`). **No sabe** de dónde vienen los datos. | `StatelessWidget`, `StatefulWidget` |
| **2. LÓGICA / ESTADO (`Controllers`/`Providers`)** | **Manejo de Estado.** Almacena el estado actual, notifica a la vista cuando cambia, y llama a los servicios. **No sabe** cómo se pinta la UI. | **Provider**, **Riverpod**, **Bloc**, **GetX** |
| **3. SERVICIOS (`Services`/`Repositories`)** | **Datos y Reglas de Negocio.** Contiene la lógica pura (conexión HTTP, cálculo de impuestos, acceso a la caché). | `ApiService`, `UserRepository` |

### Código de Ejemplo (Visión Senior)

Un flujo de trabajo profesional siempre sigue un camino claro:

1.  **Vista** (presiona un botón).
2.  **Lógica/Estado** (recibe la acción).
3.  **Servicio** (obtiene o guarda el dato).
4.  **Lógica/Estado** (procesa la respuesta y actualiza el estado).
5.  **Vista** (reconstruye la UI automáticamente con el nuevo estado).

```dart
// 1. services/product_repository.dart
// Responsabilidad: Solo saber CÓMO obtener datos.
class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    // Llama a API o DB...
    return []; 
  }
}

// 2. features/product/product_controller.dart (Lógica/Estado)
// Responsabilidad: Almacenar, procesar y notificar el estado.
class ProductController extends ChangeNotifier {
  final ProductRepository _repo = ProductRepository();
  List<Product> products = [];
  
  Future<void> loadProducts() async {
    products = await _repo.fetchProducts();
    notifyListeners(); // Avisa a la vista que hay nuevos datos.
  }
}

// 3. features/product/product_screen.dart (Vista)
// Responsabilidad: Solo pintar lo que el controlador le dice.
class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Escucha el estado del controlador
    final controller = Provider.of<ProductController>(context); 

    if (controller.products.isEmpty) {
      return Center(child: CircularProgressIndicator()); // Pinta si está vacío
    }
    
    // Pinta la lista usando los datos ya cargados
    return ListView.builder(
      itemCount: controller.products.length,
      itemBuilder: (context, index) => Text(controller.products[index].name),
    );
  }
}
```

# Consejos de Estilo (Código Senior)

## 1. Nombres Claros y Explícitos
- Evita abreviaturas vagas.  
  **Ejemplo:**  
  - Usa `calculateTax` en lugar de `calcT`.  
  - Usa `ProductDetailsPage` en lugar de `ProdDet`.

---

## 2. Archivos Cortos
- Intenta que tus archivos no superen las **300-500 líneas**.  
- Si un archivo es muy largo, es una señal de que necesitas dividirlo usando otra capa o la directiva `part`.

---

## 3. Encapsulación de Métodos
- Utiliza el prefijo de underscore `_` para los miembros de clase que solo deben ser accedidos internamente.  
  **Ejemplo:**  
  ```dart
  int _privateValue;
