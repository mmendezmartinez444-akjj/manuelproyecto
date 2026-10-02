import 'package:flutter/material.dart';

import '../state/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/empty_state.dart';
import '../widgets/lifecycle_banner.dart';
import '../widgets/resource_list_tile.dart';
import 'detail_screen.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  void _openDetail(BuildContext context, String id) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetailScreen(resourceId: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final percent = appState.completionPercent;
    final completed = appState.completedResources;
    final summaries = appState.categorySummaries;
    final lastEvent = appState.lifecycleHistory.first;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 4),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Progreso',
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
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${(percent * 100).round()}%',
                          style: const TextStyle(
                            fontFamily: fontDisplay,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${appState.completedCount} completados',
                              style: const TextStyle(
                                fontFamily: fontBody,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${appState.pendingCount} pendientes',
                              style: TextStyle(
                                fontFamily: fontBody,
                                fontSize: 12,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: percent,
                        minHeight: 8,
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        valueColor: const AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              LifecycleEventCard(
                label: 'Último evento de ciclo de vida',
                value: '${lastEvent.label} a las ${lastEvent.timeLabel}',
              ),
              const SizedBox(height: 20),
              const Text(
                'Resumen por categoría',
                style: TextStyle(
                  fontFamily: fontBody,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onBg,
                ),
              ),
              const SizedBox(height: 14),
              for (final summary in summaries)
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: summary.category.lightColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                summary.category.label,
                                style: const TextStyle(
                                  fontFamily: fontBody,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.onBg,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${summary.completed}/${summary.total}',
                            style: TextStyle(
                              fontFamily: fontBody,
                              fontSize: 12,
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: LinearProgressIndicator(
                          value: summary.percent,
                          minHeight: 6,
                          backgroundColor: AppColors.border,
                          valueColor: AlwaysStoppedAnimation(summary.category.lightColor),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              const Text(
                'Recursos completados',
                style: TextStyle(
                  fontFamily: fontBody,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onBg,
                ),
              ),
              const SizedBox(height: 12),
              if (completed.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: EmptyState(
                    icon: Icons.pending_actions_rounded,
                    title: 'Todavía no has completado recursos',
                    message: 'Marca un recurso como completado desde su detalle.',
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: completed.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final resource = completed[index];
                    return ResourceListTile(
                      resource: resource,
                      isFavorite: appState.isFavorite(resource.id),
                      isCompleted: true,
                      onTap: () => _openDetail(context, resource.id),
                      onToggleFavorite: () => appState.toggleFavorite(resource.id),
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
