import 'package:flutter/material.dart';

import '../models/study_resource.dart';
import '../theme/app_theme.dart';

class ResourceGridCard extends StatelessWidget {
  const ResourceGridCard({
    super.key,
    required this.resource,
    required this.isFavorite,
    required this.isCompleted,
    required this.onTap,
  });

  final StudyResource resource;
  final bool isFavorite;
  final bool isCompleted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        color: resource.category.color,
                        child: Center(
                          child: Icon(
                            resource.type.icon,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    if (isCompleted)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: _Badge(
                          icon: Icons.check_rounded,
                          color: AppColors.success,
                        ),
                      ),
                    if (isFavorite)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: _Badge(
                          icon: Icons.favorite_rounded,
                          color: Colors.black.withValues(alpha: 0.4),
                          iconColor: Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      resource.title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontFamily: fontBody,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${resource.category.label} · ${resource.level.label}',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontFamily: fontBody,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.icon, required this.color, this.iconColor = Colors.white});

  final IconData icon;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, size: 14, color: iconColor),
    );
  }
}
