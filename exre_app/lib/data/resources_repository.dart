import '../models/study_resource.dart';

/// Datos locales de prueba: catálogo de recursos de estudio de ExRE.
/// No requiere servidor ni base de datos remota.
const List<StudyResource> kStudyResources = [
  StudyResource(
    id: 'flu-01',
    title: 'Introducción a Widgets en Flutter',
    category: ResourceCategory.flutter,
    author: 'Roilán Rodríguez',
    durationMinutes: 18,
    level: ResourceLevel.basico,
    description:
        'Recorrido por los widgets fundamentales de Flutter: StatelessWidget, '
        'StatefulWidget y el árbol de elementos.',
    type: ResourceType.video,
    simulatedContent: 'https://exre.local/videos/flutter-widgets-intro',
  ),
  StudyResource(
    id: 'flu-02',
    title: 'Gestión de estado con ChangeNotifier',
    category: ResourceCategory.flutter,
    author: 'Ana Belén Pérez',
    durationMinutes: 25,
    level: ResourceLevel.intermedio,
    description:
        'Cómo usar ChangeNotifier e InheritedNotifier del SDK de Flutter '
        'para compartir estado sin paquetes externos.',
    type: ResourceType.lectura,
    simulatedContent: 'https://exre.local/lecturas/changenotifier',
  ),
  StudyResource(
    id: 'flu-03',
    title: 'Ciclo de vida de la aplicación',
    category: ResourceCategory.flutter,
    author: 'Carlos Luis García',
    durationMinutes: 15,
    level: ResourceLevel.intermedio,
    description:
        'Explicación de AppLifecycleState y WidgetsBindingObserver para '
        'detectar resumed, inactive, paused y detached.',
    type: ResourceType.documento,
    simulatedContent: 'https://exre.local/docs/lifecycle-flutter',
  ),
  StudyResource(
    id: 'flu-04',
    title: 'Taller práctico: contador con estado',
    category: ResourceCategory.flutter,
    author: 'Roilán Rodríguez',
    durationMinutes: 30,
    level: ResourceLevel.basico,
    description:
        'Ejercicio guiado para practicar setState y la reconstrucción de '
        'widgets en Flutter.',
    type: ResourceType.practica,
    simulatedContent: 'https://exre.local/practicas/contador-estado',
  ),
  StudyResource(
    id: 'and-01',
    title: 'Arquitectura de Android moderna',
    category: ResourceCategory.android,
    author: 'María Fernández',
    durationMinutes: 22,
    level: ResourceLevel.intermedio,
    description:
        'Visión general de actividades, ciclo de vida nativo y su relación '
        'con el motor de Flutter sobre Android.',
    type: ResourceType.lectura,
    simulatedContent: 'https://exre.local/lecturas/android-arquitectura',
  ),
  StudyResource(
    id: 'and-02',
    title: 'Permisos y almacenamiento local',
    category: ResourceCategory.android,
    author: 'Carlos Luis García',
    durationMinutes: 20,
    level: ResourceLevel.intermedio,
    description:
        'Cómo funcionan los permisos en Android y el almacenamiento local '
        'de datos de prueba dentro de una app.',
    type: ResourceType.documento,
    simulatedContent: 'https://exre.local/docs/android-permisos',
  ),
  StudyResource(
    id: 'and-03',
    title: 'Publicar un APK de prueba',
    category: ResourceCategory.android,
    author: 'Ana Belén Pérez',
    durationMinutes: 16,
    level: ResourceLevel.basico,
    description:
        'Pasos básicos para compilar y ejecutar una app Flutter en un '
        'dispositivo o emulador Android.',
    type: ResourceType.video,
    simulatedContent: 'https://exre.local/videos/publicar-apk',
  ),
  StudyResource(
    id: 'and-04',
    title: 'Práctica: emulador y hot reload',
    category: ResourceCategory.android,
    author: 'Roilán Rodríguez',
    durationMinutes: 28,
    level: ResourceLevel.basico,
    description:
        'Ejercicio práctico para dominar el flujo de trabajo con el '
        'emulador Android y hot reload.',
    type: ResourceType.practica,
    simulatedContent: 'https://exre.local/practicas/emulador-hotreload',
  ),
  StudyResource(
    id: 'lay-01',
    title: 'Row, Column y Flex a fondo',
    category: ResourceCategory.layouts,
    author: 'María Fernández',
    durationMinutes: 24,
    level: ResourceLevel.basico,
    description:
        'Comprende cómo Flutter distribuye el espacio con Row, Column y '
        'los widgets de flexibilidad.',
    type: ResourceType.lectura,
    simulatedContent: 'https://exre.local/lecturas/row-column-flex',
  ),
  StudyResource(
    id: 'lay-02',
    title: 'Evitando overflow en pantallas pequeñas',
    category: ResourceCategory.layouts,
    author: 'Carlos Luis García',
    durationMinutes: 19,
    level: ResourceLevel.intermedio,
    description:
        'Técnicas con Expanded, Flexible y SingleChildScrollView para '
        'layouts adaptables sin overflow.',
    type: ResourceType.video,
    simulatedContent: 'https://exre.local/videos/evitar-overflow',
  ),
  StudyResource(
    id: 'lay-03',
    title: 'Diseño responsivo con MediaQuery',
    category: ResourceCategory.layouts,
    author: 'Ana Belén Pérez',
    durationMinutes: 21,
    level: ResourceLevel.avanzado,
    description:
        'Uso de MediaQuery y LayoutBuilder para adaptar interfaces a '
        'distintos tamaños de pantalla.',
    type: ResourceType.documento,
    simulatedContent: 'https://exre.local/docs/mediaquery-responsivo',
  ),
  StudyResource(
    id: 'lay-04',
    title: 'Taller: tarjetas adaptables',
    category: ResourceCategory.layouts,
    author: 'Roilán Rodríguez',
    durationMinutes: 27,
    level: ResourceLevel.intermedio,
    description:
        'Construye tarjetas de recursos que se adaptan a distintos anchos '
        'de pantalla sin deformarse.',
    type: ResourceType.practica,
    simulatedContent: 'https://exre.local/practicas/tarjetas-adaptables',
  ),
  StudyResource(
    id: 'scr-01',
    title: 'ListView: builder vs separated',
    category: ResourceCategory.scrollables,
    author: 'María Fernández',
    durationMinutes: 20,
    level: ResourceLevel.basico,
    description:
        'Diferencias entre ListView, ListView.builder y '
        'ListView.separated, y cuándo usar cada uno.',
    type: ResourceType.lectura,
    simulatedContent: 'https://exre.local/lecturas/listview-comparativa',
  ),
  StudyResource(
    id: 'scr-02',
    title: 'GridView.builder para galerías',
    category: ResourceCategory.scrollables,
    author: 'Carlos Luis García',
    durationMinutes: 23,
    level: ResourceLevel.intermedio,
    description:
        'Configura SliverGridDelegateWithFixedCrossAxisCount para crear '
        'cuadrículas uniformes y responsivas.',
    type: ResourceType.video,
    simulatedContent: 'https://exre.local/videos/gridview-builder',
  ),
  StudyResource(
    id: 'scr-03',
    title: 'itemExtent y rendimiento de listas',
    category: ResourceCategory.scrollables,
    author: 'Ana Belén Pérez',
    durationMinutes: 17,
    level: ResourceLevel.avanzado,
    description:
        'Cómo itemExtent mejora el rendimiento de scroll cuando todos '
        'los elementos comparten la misma altura.',
    type: ResourceType.documento,
    simulatedContent: 'https://exre.local/docs/itemextent-rendimiento',
  ),
  StudyResource(
    id: 'scr-04',
    title: 'Práctica: lista de favoritos',
    category: ResourceCategory.scrollables,
    author: 'Roilán Rodríguez',
    durationMinutes: 26,
    level: ResourceLevel.basico,
    description:
        'Ejercicio guiado para construir una lista de favoritos con '
        'estado vacío y eliminación de elementos.',
    type: ResourceType.practica,
    simulatedContent: 'https://exre.local/practicas/lista-favoritos',
  ),
  StudyResource(
    id: 'sli-01',
    title: 'Introducción a Slivers',
    category: ResourceCategory.slivers,
    author: 'María Fernández',
    durationMinutes: 29,
    level: ResourceLevel.avanzado,
    description:
        'Qué son los Slivers y por qué ListView y GridView se construyen '
        'internamente sobre ellos.',
    type: ResourceType.lectura,
    simulatedContent: 'https://exre.local/lecturas/intro-slivers',
  ),
  StudyResource(
    id: 'sli-02',
    title: 'CustomScrollView paso a paso',
    category: ResourceCategory.slivers,
    author: 'Carlos Luis García',
    durationMinutes: 31,
    level: ResourceLevel.avanzado,
    description:
        'Combina SliverAppBar, SliverList y SliverGrid dentro de un '
        'CustomScrollView.',
    type: ResourceType.video,
    simulatedContent: 'https://exre.local/videos/customscrollview',
  ),
  StudyResource(
    id: 'sli-03',
    title: 'SliverGridDelegate explicado',
    category: ResourceCategory.slivers,
    author: 'Ana Belén Pérez',
    durationMinutes: 14,
    level: ResourceLevel.intermedio,
    description:
        'Detalle de crossAxisCount, crossAxisSpacing, mainAxisSpacing y '
        'childAspectRatio en las cuadrículas.',
    type: ResourceType.documento,
    simulatedContent: 'https://exre.local/docs/slivergriddelegate',
  ),
  StudyResource(
    id: 'sli-04',
    title: 'Práctica: cuadrícula con encabezado',
    category: ResourceCategory.slivers,
    author: 'Roilán Rodríguez',
    durationMinutes: 33,
    level: ResourceLevel.avanzado,
    description:
        'Construye una cuadrícula de recursos con un encabezado que se '
        'contrae al hacer scroll.',
    type: ResourceType.practica,
    simulatedContent: 'https://exre.local/practicas/grid-encabezado',
  ),
  StudyResource(
    id: 'nav-01',
    title: 'Navigator y pila de rutas',
    category: ResourceCategory.navegacion,
    author: 'María Fernández',
    durationMinutes: 18,
    level: ResourceLevel.basico,
    description:
        'Cómo funciona la pila de navegación de Flutter con '
        'Navigator.push y Navigator.pop.',
    type: ResourceType.lectura,
    simulatedContent: 'https://exre.local/lecturas/navigator-pila',
  ),
  StudyResource(
    id: 'nav-02',
    title: 'BottomNavigationBar en profundidad',
    category: ResourceCategory.navegacion,
    author: 'Carlos Luis García',
    durationMinutes: 20,
    level: ResourceLevel.intermedio,
    description:
        'Diseño de navegación inferior con BottomNavigationBar e '
        'IndexedStack para conservar el estado de cada pestaña.',
    type: ResourceType.video,
    simulatedContent: 'https://exre.local/videos/bottomnavigationbar',
  ),
  StudyResource(
    id: 'nav-03',
    title: 'Paso de datos entre pantallas',
    category: ResourceCategory.navegacion,
    author: 'Ana Belén Pérez',
    durationMinutes: 16,
    level: ResourceLevel.basico,
    description:
        'Buenas prácticas para pasar identificadores y datos entre '
        'pantallas al navegar.',
    type: ResourceType.documento,
    simulatedContent: 'https://exre.local/docs/paso-datos-pantallas',
  ),
  StudyResource(
    id: 'nav-04',
    title: 'Práctica: flujo catálogo-detalle',
    category: ResourceCategory.navegacion,
    author: 'Roilán Rodríguez',
    durationMinutes: 24,
    level: ResourceLevel.intermedio,
    description:
        'Implementa un flujo completo de catálogo, detalle y regreso '
        'usando un único mecanismo de navegación.',
    type: ResourceType.practica,
    simulatedContent: 'https://exre.local/practicas/flujo-catalogo-detalle',
  ),
];
