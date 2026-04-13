import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

class TimberAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TimberAppBar({
    super.key,
    this.leading,
    this.avatarUrl,
    this.onAvatarTap,
  });

  final Widget? leading;
  final String? avatarUrl;
  final VoidCallback? onAvatarTap;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            leading ??
                Icon(
                  Icons.menu,
                  color: AppColors.primary,
                ),
            const SizedBox(width: 12),
            Text(
              'The Timber Lodge',
              style: GoogleFonts.notoSerif(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onAvatarTap,
              child: _Avatar(url: avatarUrl),
            ),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({this.url});
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surfaceContainerHighest,
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.1),
          width: 2,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: url != null
          ? Image.network(url!, fit: BoxFit.cover)
          : Icon(Icons.person, color: AppColors.onSurfaceVariant, size: 22),
    );
  }
}
