import 'package:flutter/material.dart';

import '../models/study_resource.dart';
import '../theme/app_theme.dart';

/// Barra horizontal de filtro por categoría.
/// Construida con ListView.separated para cumplir el requisito de usar
/// separadores visuales entre elementos.
class CategoryFilterBar extends StatelessWidget {
  const CategoryFilterBar({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final ResourceCategory? selected;
  final ValueChanged<ResourceCategory?> onSelected;

  @override
  Widget build(BuildContext context) {
    final categories = ResourceCategory.values;
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _Chip(label: 'Todas', selected: selected == null, onTap: () => onSelected(null));
          }
          final category = categories[index - 1];
          final isSelected = selected == category;
          return _Chip(
            label: category.label,
            selected: isSelected,
            onTap: () => onSelected(isSelected ? null : category),
          );
        },
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.white : Colors.white.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? Colors.white : Colors.white.withValues(alpha: 0.3),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: fontBody,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: selected ? AppColors.primary : Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ),
      ),
    );
  }
}
