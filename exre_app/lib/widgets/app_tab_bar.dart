import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (icon: Icons.home_rounded, label: 'Inicio'),
    (icon: Icons.menu_book_rounded, label: 'Catálogo'),
    (icon: Icons.grid_view_rounded, label: 'Galería'),
    (icon: Icons.favorite_rounded, label: 'Favoritos'),
    (icon: Icons.trending_up_rounded, label: 'Progreso'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bg,
        border: Border(top: BorderSide(color: Color(0x26FFFFFF))),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            for (var i = 0; i < _items.length; i++)
              Expanded(
                child: InkWell(
                  onTap: () => onTap(i),
                  borderRadius: BorderRadius.circular(14),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _items[i].icon,
                          size: 22,
                          color: currentIndex == i
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.5),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _items[i].label,
                          style: TextStyle(
                            fontFamily: fontBody,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: currentIndex == i
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
