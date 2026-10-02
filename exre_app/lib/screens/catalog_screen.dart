import 'package:flutter/material.dart';

import '../state/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/category_filter_bar.dart';
import '../widgets/empty_state.dart';
import '../widgets/resource_list_tile.dart';
import 'detail_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  void _openDetail(BuildContext context, String id) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetailScreen(resourceId: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final resources = appState.filteredResources;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Catálogo',
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
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.search_rounded, size: 18, color: AppColors.textTertiary),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          fontFamily: fontBody,
                          fontSize: 13,
                          color: AppColors.textPrimary,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Buscar por título, categoría o autor',
                          hintStyle: TextStyle(
                            fontFamily: fontBody,
                            fontSize: 12,
                            color: AppColors.textTertiary,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        onChanged: appState.setSearchText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              CategoryFilterBar(
                selected: appState.selectedCategory,
                onSelected: appState.setCategory,
              ),
              const SizedBox(height: 16),
              Text(
                'RESULTADOS (${resources.length})',
                style: TextStyle(
                  fontFamily: fontBody,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: 10),
              if (resources.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: EmptyState(
                    icon: Icons.search_off_rounded,
                    title: 'Sin resultados',
                    message:
                        'No hay recursos que coincidan con tu búsqueda o filtro.',
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: resources.length,
                  itemBuilder: (context, index) {
                    final resource = resources[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ResourceListTile(
                        resource: resource,
                        isFavorite: appState.isFavorite(resource.id),
                        isCompleted: appState.isCompleted(resource.id),
                        onTap: () => _openDetail(context, resource.id),
                        onToggleFavorite: () =>
                            appState.toggleFavorite(resource.id),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
