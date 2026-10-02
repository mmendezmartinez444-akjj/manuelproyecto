import 'package:flutter/material.dart';

import '../state/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/resource_grid_card.dart';
import 'detail_screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  void _openDetail(BuildContext context, String id) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetailScreen(resourceId: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final resources = appState.resources;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 4),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Galería',
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
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            itemCount: resources.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 0.74,
            ),
            itemBuilder: (context, index) {
              final resource = resources[index];
              return ResourceGridCard(
                resource: resource,
                isFavorite: appState.isFavorite(resource.id),
                isCompleted: appState.isCompleted(resource.id),
                onTap: () => _openDetail(context, resource.id),
              );
            },
          ),
        ),
      ],
    );
  }
}
