import 'package:flutter/material.dart';

enum ResourceCategory {
  flutter('Flutter', Icons.flutter_dash_rounded, Color(0xFF0553B1), Color(0xFF54C5F8)),
  android('Android', Icons.android_rounded, Color(0xFF1DA260), Color(0xFF4ADE80)),
  layouts('Layouts', Icons.dashboard_customize_rounded, Color(0xFFF59E0B), Color(0xFFFCD34D)),
  scrollables('Scrollables', Icons.swap_vert_rounded, Color(0xFFDB2777), Color(0xFFF9A8D4)),
  slivers('Slivers', Icons.layers_rounded, Color(0xFF7C3AED), Color(0xFFC4B5FD)),
  navegacion('Navegación', Icons.alt_route_rounded, Color(0xFFDC2626), Color(0xFFFCA5A5));

  const ResourceCategory(this.label, this.icon, this.color, this.lightColor);

  final String label;
  final IconData icon;
  final Color color;
  final Color lightColor;
}

enum ResourceLevel {
  basico('Básico'),
  intermedio('Intermedio'),
  avanzado('Avanzado');

  const ResourceLevel(this.label);

  final String label;
}

enum ResourceType {
  video('Video', Icons.play_arrow_rounded),
  lectura('Lectura', Icons.menu_book_rounded),
  practica('Práctica', Icons.science_rounded),
  documento('Documento', Icons.description_rounded);

  const ResourceType(this.label, this.icon);

  final String label;
  final IconData icon;
}

class StudyResource {
  const StudyResource({
    required this.id,
    required this.title,
    required this.category,
    required this.author,
    required this.durationMinutes,
    required this.level,
    required this.description,
    required this.type,
    required this.simulatedContent,
  });

  final String id;
  final String title;
  final ResourceCategory category;
  final String author;
  final int durationMinutes;
  final ResourceLevel level;
  final String description;
  final ResourceType type;
  final String simulatedContent;
}
