import 'package:flutter/material.dart';

import '../state/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/empty_state.dart';
import '../widgets/resource_list_tile.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  void _openDetail(BuildContext context, String id) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetailScreen(resourceId: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final favorites = appState.favoriteResources;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 4),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Favoritos',
              style: TextStyle(
                fontFamily: fontDisplay,
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColors.onBg,
              ),
            ),
          ),
        ),
        Expanded(
          child: favorites.isEmpty
              ? const EmptyState(
                  icon: Icons.favorite_border_rounded,
                  title: 'Aún no tienes favoritos',
                  message:
                      'Toca el corazón en cualquier recurso del catálogo o '
                      'la galería para guardarlo aquí.',
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                  itemCount: favorites.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final resource = favorites[index];
                    return ResourceListTile(
                      resource: resource,
                      isFavorite: true,
                      isCompleted: appState.isCompleted(resource.id),
                      onTap: () => _openDetail(context, resource.id),
                      onToggleFavorite: () => appState.toggleFavorite(resource.id),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
