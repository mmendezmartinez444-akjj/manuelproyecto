import 'package:flutter/material.dart';

import '../models/study_resource.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/action_buttons.dart';
import '../widgets/meta_chip.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.resourceId});

  final String resourceId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      AppStateScope.of(context).openResource(widget.resourceId);
    });
  }

  @override
  void dispose() {
    AppStateScope.of(context).clearOpenResource();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final StudyResource resource = appState.resourceById(widget.resourceId);
    final isFavorite = appState.isFavorite(resource.id);
    final isCompleted = appState.isCompleted(resource.id);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 160,
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      right: 20,
                      top: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _CircleButton(
                            icon: Icons.arrow_back_rounded,
                            onTap: () => Navigator.of(context).pop(),
                          ),
                          _CircleButton(
                            icon: isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            iconColor: isFavorite ? AppColors.favorite : Colors.white,
                            onTap: () => appState.toggleFavorite(resource.id),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.24)),
                        ),
                        child: Icon(resource.type.icon, size: 26, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resource.category.label.toUpperCase(),
                      style: TextStyle(
                        fontFamily: fontBody,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      resource.title,
                      style: const TextStyle(
                        fontFamily: fontDisplay,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.onBg,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.person_rounded,
                          size: 13,
                          color: Colors.white.withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          resource.author,
                          style: TextStyle(
                            fontFamily: fontBody,
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: MetaChip(
                            icon: Icons.timer_rounded,
                            label: '${resource.durationMinutes} min',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: MetaChip(
                            icon: Icons.signal_cellular_alt_rounded,
                            label: resource.level.label,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: MetaChip(
                            icon: resource.type.icon,
                            label: resource.type.label,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Descripción',
                      style: TextStyle(
                        fontFamily: fontBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onBg,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      resource.description,
                      style: TextStyle(
                        fontFamily: fontBody,
                        fontSize: 13,
                        height: 1.5,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.primarySoft,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.link_rounded, size: 16, color: AppColors.primaryLight),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              resource.simulatedContent,
                              style: const TextStyle(
                                fontFamily: fontBody,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryLight,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryPillButton(
                        icon: isCompleted ? Icons.remove_done_rounded : Icons.check_rounded,
                        label: isCompleted ? 'Marcar como pendiente' : 'Marcar como completado',
                        onTap: () => appState.toggleCompleted(resource.id),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: SecondaryPillButton(
                        icon: Icons.arrow_back_rounded,
                        label: 'Volver al listado',
                        onTap: () => Navigator.of(context).pop(),
                      ),
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

class _CircleButton extends StatelessWidget {
  const _CircleButton({required this.icon, required this.onTap, this.iconColor = Colors.white});

  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.2),
      shape: const CircleBorder(
        side: BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(icon, size: 18, color: iconColor),
        ),
      ),
    );
  }
}
