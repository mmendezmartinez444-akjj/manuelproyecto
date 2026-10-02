import 'package:flutter/material.dart';

import '../models/study_resource.dart';
import '../theme/app_theme.dart';

class ResourceListTile extends StatelessWidget {
  const ResourceListTile({
    super.key,
    required this.resource,
    required this.isFavorite,
    required this.isCompleted,
    required this.onTap,
    required this.onToggleFavorite,
  });

  final StudyResource resource;
  final bool isFavorite;
  final bool isCompleted;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: resource.category.color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(resource.type.icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      resource.title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontFamily: fontBody,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            resource.category.label,
                            style: TextStyle(
                              color: resource.category.lightColor,
                              fontFamily: fontBody,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Text(
                          ' · ',
                          style: TextStyle(
                            color: AppColors.textTertiary,
                            fontFamily: fontBody,
                            fontSize: 12,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            resource.author,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontFamily: fontBody,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.timer_rounded,
                          size: 12,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${resource.durationMinutes} min',
                          style: const TextStyle(
                            color: AppColors.textTertiary,
                            fontFamily: fontBody,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          resource.level.label,
                          style: const TextStyle(
                            color: AppColors.textTertiary,
                            fontFamily: fontBody,
                            fontSize: 11,
                          ),
                        ),
                        if (isCompleted) ...[
                          const SizedBox(width: 8),
                          Icon(
                            Icons.check_circle_rounded,
                            size: 14,
                            color: AppColors.success,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                  color: isFavorite ? AppColors.favorite : AppColors.textTertiary,
                ),
                onPressed: onToggleFavorite,
                tooltip: isFavorite ? 'Quitar de favoritos' : 'Marcar favorito',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
