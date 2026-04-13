import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

enum BadgeStatus { pending, inProgress, resolved, checkout, notReady, stayOver }

class StatusBadge extends StatelessWidget {
  const StatusBadge(this.status, {super.key});

  final BadgeStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        _label,
        style: GoogleFonts.manrope(
          fontSize: 9,
          fontWeight: FontWeight.w800,
          color: _textColor,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  String get _label => switch (status) {
        BadgeStatus.pending => 'PENDING',
        BadgeStatus.inProgress => 'IN PROGRESS',
        BadgeStatus.resolved => 'RESOLVED',
        BadgeStatus.checkout => 'CHECKOUT',
        BadgeStatus.notReady => 'NOT READY',
        BadgeStatus.stayOver => 'STAY OVER',
      };

  Color get _backgroundColor => switch (status) {
        BadgeStatus.pending => const Color(0xFFFEF3C7),   // amber-100
        BadgeStatus.inProgress => const Color(0xFFDBEAFE), // blue-100
        BadgeStatus.resolved => const Color(0xFFDCFCE7),   // green-100
        BadgeStatus.checkout => AppColors.error.withValues(alpha: 0.1),
        BadgeStatus.notReady => AppColors.surfaceContainerHighest,
        BadgeStatus.stayOver => AppColors.secondary.withValues(alpha: 0.1),
      };

  Color get _textColor => switch (status) {
        BadgeStatus.pending => const Color(0xFF92400E),   // amber-800
        BadgeStatus.inProgress => const Color(0xFF1E40AF), // blue-800
        BadgeStatus.resolved => const Color(0xFF166534),   // green-800
        BadgeStatus.checkout => AppColors.error,
        BadgeStatus.notReady => AppColors.onSurfaceVariant,
        BadgeStatus.stayOver => AppColors.secondary,
      };
}
