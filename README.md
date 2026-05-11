# Examen Flutter CRUD

Aplicación Flutter desarrollada como examen práctico utilizando:

- Flutter
- Provider
- HTTP REST API
- Django Backend
- Arquitectura basada en Services + Providers

---

# Características

La aplicación permite administrar:

- Productos
- Categorías
- Proveedores
- Carrito de compras simulado
- Recuperación de contraseña simulada

Cada módulo incluye operaciones CRUD:

- Listar
- Crear
- Editar
- Eliminar

---

# Tecnologías utilizadas

## Frontend

- Flutter
- Dart
- Provider

## Backend

- Django REST
- API RESTful

---

# Arquitectura

El proyecto está organizado utilizando:

```txt
lib/
│
├── models/
├── providers/
├── routes/
├── screens/
├── services/
├── widgets/
```

---

# Manejo de estado

Se utilizó `Provider` para:

- Estado global
- Formularios
- Actualización reactiva de listas
- Manejo de carga
- Carrito de compras

---

# Servicios REST

La aplicación consume los siguientes endpoints:

## Productos

- `product_list_rest`
- `product_add_rest`
- `product_edit_rest`
- `product_del_rest`

## Categorías

- `category_list_rest`
- `category_add_rest`
- `category_edit_rest`
- `category_del_rest`

## Proveedores

- `provider_list_rest`
- `provider_add_rest`
- `provider_edit_rest`
- `provider_del_rest`

---

# Autenticación

Las solicitudes utilizan autenticación Basic Auth.

```dart
String basicAuth =
    'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
```

---

# Dependencias principales

```yaml
dependencies:
  flutter:
    sdk: flutter

  provider:
  http:
```

---

# Ejecución del proyecto

## Instalar dependencias

```bash
flutter pub get
```

## Ejecutar aplicación

```bash
flutter run
```

---

# Funcionalidades simuladas

Debido a que el backend no dispone de endpoints específicos para ciertas funcionalidades, se implementaron simulaciones locales en Flutter.

## Carrito de compras

- Agregar productos
- Aumentar/disminuir cantidades
- Calcular total
- Simular compra

## Recuperación de contraseña

- Ingreso de correo electrónico
- Simulación de envío de correo
- Navegación integrada desde login

---

# Mejoras realizadas

- Corrección de layouts Flutter
- Optimización de navegación
- Corrección de errores de renderizado
- Refactor de widgets
- Corrección de inconsistencias del backend (`providerid` vs `provider_id`)
- Mejora visual de tarjetas y formularios
- Implementación de carrito de compras local
- Implementación de recuperación de contraseña simulada

---

# Autor

Desarrollado por Daniel Cisternas.
