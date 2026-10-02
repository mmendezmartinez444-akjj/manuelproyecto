# ExRE — Explorador de Recursos de Estudio

Proyecto práctico de la asignatura *Programación para Dispositivos Móviles*.
App Flutter para consultar, filtrar, marcar como favoritos y seguir el
progreso de recursos de estudio (videos, lecturas, prácticas y documentos).
No requiere servidor, base de datos remota ni autenticación: los datos
provienen de una lista local de prueba (`lib/data/resources_repository.dart`).

## Requisitos

- Flutter SDK (canal stable) instalado y configurado.
- Un dispositivo Android físico o un emulador en ejecución.

## Cómo ejecutar

```bash
flutter pub get
flutter run
```

Para compilar un APK de prueba:

```bash
flutter build apk --debug
```

## Pantallas

1. **Inicio** — resumen de la app, estado del ciclo de vida y accesos rápidos.
2. **Catálogo** — lista de recursos con búsqueda y filtro por categoría.
3. **Galería** — cuadrícula de recursos (GridView.builder).
4. **Detalle** — información completa del recurso, favorito y completado.
5. **Favoritos** — recursos marcados como favoritos.
6. **Progreso** — porcentaje completado, resumen por categoría y último
   evento de ciclo de vida.

## Estado y navegación

El estado global se maneja con `ChangeNotifier` + `InheritedNotifier`
(`lib/state/app_state.dart`), sin paquetes externos de manejo de estado.
La navegación entre pantallas usa únicamente `Navigator.push`.
