import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract final class AppTextStyles {
  // Noto Serif — headlines, display, moment-driven text
  static TextStyle displayLarge = GoogleFonts.notoSerif(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
    height: 1.12,
  );

  static TextStyle displayMedium = GoogleFonts.notoSerif(
    fontSize: 45,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
    height: 1.16,
  );

  static TextStyle headlineLarge = GoogleFonts.notoSerif(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
    height: 1.22,
  );

  static TextStyle headlineMedium = GoogleFonts.notoSerif(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
    height: 1.29,
  );

  static TextStyle headlineSmall = GoogleFonts.notoSerif(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
    height: 1.33,
  );

  static TextStyle titleLarge = GoogleFonts.notoSerif(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
    height: 1.27,
  );

  // Manrope — body, labels, all functional data
  static TextStyle titleMedium = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
    height: 1.5,
  );

  static TextStyle titleSmall = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
    height: 1.43,
  );

  static TextStyle bodyLarge = GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
    height: 1.5,
  );

  static TextStyle bodyMedium = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
    height: 1.5,
  );

  static TextStyle bodySmall = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurfaceVariant,
    height: 1.5,
  );

  static TextStyle labelLarge = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
    letterSpacing: 0.1,
  );

  static TextStyle labelMedium = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
    letterSpacing: 0.5,
  );

  static TextStyle labelSmall = GoogleFonts.manrope(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurfaceVariant,
    letterSpacing: 1.5,
  );

  // Convenience: uppercase tracking label used throughout the designs
  static TextStyle eyebrow = GoogleFonts.manrope(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.secondary,
    letterSpacing: 2.0,
  );
}
