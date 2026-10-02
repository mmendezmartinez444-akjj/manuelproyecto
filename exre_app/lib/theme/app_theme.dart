import 'package:flutter/material.dart';

/// Paleta y tipografía extraídas del diseño de referencia (Diseño.pen).
class AppColors {
  AppColors._();

  static const primary = Color(0xFF4F46E5);
  static const primarySoft = Color(0xFF3A32A0);
  static const primaryLight = Color(0xFFA5B4FC);
  static const bg = Color(0xFF231C6B);
  static const surface = Color(0xFF2E2789);
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFC5BFEE);
  static const textTertiary = Color(0xFF948CCB);
  static const border = Color(0xFF443BA5);
  static const success = Color(0xFF16A34A);
  static const warning = Color(0xFFF59E0B);
  static const danger = Color(0xFFEF4444);
  static const favorite = Color(0xFFF43F5E);
  static const onBg = Color(0xFFFFFFFF);
  static const onBgMuted = Color(0xB3FFFFFF);
  static const onBgSubtle = Color(0x80FFFFFF);
}

const String fontDisplay = 'Poppins';
const String fontBody = 'Inter';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.bg,
  fontFamily: fontBody,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: Colors.white,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    outline: AppColors.textTertiary,
    error: AppColors.danger,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: fontDisplay,
      fontWeight: FontWeight.w700,
      color: AppColors.onBg,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontDisplay,
      fontWeight: FontWeight.w700,
      color: AppColors.onBg,
    ),
    titleLarge: TextStyle(
      fontFamily: fontDisplay,
      fontWeight: FontWeight.w700,
      color: AppColors.onBg,
    ),
    titleMedium: TextStyle(
      fontFamily: fontBody,
      fontWeight: FontWeight.w600,
      color: AppColors.onBg,
    ),
    titleSmall: TextStyle(
      fontFamily: fontBody,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    bodyLarge: TextStyle(fontFamily: fontBody, color: AppColors.textPrimary),
    bodyMedium: TextStyle(fontFamily: fontBody, color: AppColors.onBgMuted),
    bodySmall: TextStyle(fontFamily: fontBody, color: AppColors.textTertiary),
    labelLarge: TextStyle(
      fontFamily: fontBody,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
  ),
);
