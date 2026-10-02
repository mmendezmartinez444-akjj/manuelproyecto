import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class LifecycleVisual {
  const LifecycleVisual({required this.label, required this.message});

  final String label;
  final String message;
}

LifecycleVisual lifecycleVisualFor(AppLifecycleState state) {
  switch (state) {
    case AppLifecycleState.resumed:
      return const LifecycleVisual(
        label: 'resumed',
        message: 'La app está activa y visible.',
      );
    case AppLifecycleState.inactive:
      return const LifecycleVisual(
        label: 'inactive',
        message: 'La app perdió el foco momentáneamente.',
      );
    case AppLifecycleState.paused:
      return const LifecycleVisual(
        label: 'paused',
        message: 'La app está en segundo plano.',
      );
    case AppLifecycleState.detached:
      return const LifecycleVisual(
        label: 'detached',
        message: 'El motor de Flutter sigue vivo sin vista adjunta.',
      );
    case AppLifecycleState.hidden:
      return const LifecycleVisual(
        label: 'hidden',
        message: 'La app no es visible en este momento.',
      );
  }
}

/// LifecycleCard de la pantalla de Inicio: icono en círculo + estado actual.
class LifecycleBanner extends StatelessWidget {
  const LifecycleBanner({super.key, required this.state});

  final AppLifecycleState state;

  @override
  Widget build(BuildContext context) {
    final visual = lifecycleVisualFor(state);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.sensors_rounded,
              size: 18,
              color: AppColors.primaryLight,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Estado del ciclo de vida',
                  style: TextStyle(
                    fontFamily: fontBody,
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${visual.label} · ${visual.message}',
                  style: const TextStyle(
                    fontFamily: fontBody,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// LifecycleEventCard de la pantalla de Progreso: variante compacta con
/// icono de historial.
class LifecycleEventCard extends StatelessWidget {
  const LifecycleEventCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.history_rounded, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: fontBody,
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: fontBody,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
