import 'package:flutter/material.dart';

import '../state/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/lifecycle_banner.dart';
import '../widgets/quick_access_card.dart';
import '../widgets/stat_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onQuickAccess});

  /// Cambia la pestaña activa del BottomNavigationBar (1=Catálogo,
  /// 2=Galería, 3=Favoritos, 4=Progreso).
  final ValueChanged<int> onQuickAccess;

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BIENVENIDO A',
            style: TextStyle(
              fontFamily: fontBody,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: AppColors.onBg,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'ExRE',
            style: TextStyle(
              fontFamily: fontDisplay,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.onBg,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Explorador de Recursos de Estudio: encuentra, guarda y sigue '
            'tu progreso en videos, lecturas, prácticas y documentos.',
            style: TextStyle(
              fontFamily: fontBody,
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 20),
          LifecycleBanner(state: appState.lastLifecycleState),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: StatTile(label: 'Disponibles', value: '${appState.totalCount}'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatTile(label: 'Favoritos', value: '${appState.favoritesCount}'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatTile(label: 'Completados', value: '${appState.completedCount}'),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            'Accesos rápidos',
            style: TextStyle(
              fontFamily: fontBody,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.onBg,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: QuickAccessCard(
                  icon: Icons.local_library_rounded,
                  label: 'Catálogo',
                  color: const Color(0xFF0EA5E9),
                  onTap: () => onQuickAccess(1),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickAccessCard(
                  icon: Icons.grid_view_rounded,
                  label: 'Galería',
                  color: const Color(0xFF7C3AED),
                  onTap: () => onQuickAccess(2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: QuickAccessCard(
                  icon: Icons.favorite_rounded,
                  label: 'Favoritos',
                  color: AppColors.favorite,
                  onTap: () => onQuickAccess(3),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickAccessCard(
                  icon: Icons.trending_up_rounded,
                  label: 'Progreso',
                  color: AppColors.success,
                  onTap: () => onQuickAccess(4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
