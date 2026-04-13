import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

enum TimberNavTab { stay, dining, tasks, concierge }

class TimberBottomNav extends StatelessWidget {
  const TimberBottomNav({
    super.key,
    required this.activeTab,
    required this.onTabSelected,
  });

  final TimberNavTab activeTab;
  final ValueChanged<TimberNavTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.05),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.bedroom_parent_outlined,
              activeIcon: Icons.bedroom_parent,
              label: 'Stay',
              tab: TimberNavTab.stay,
              activeTab: activeTab,
              onTap: onTabSelected,
            ),
            _NavItem(
              icon: Icons.restaurant_outlined,
              activeIcon: Icons.restaurant,
              label: 'Dining',
              tab: TimberNavTab.dining,
              activeTab: activeTab,
              onTap: onTabSelected,
            ),
            _NavItem(
              icon: Icons.assignment_turned_in_outlined,
              activeIcon: Icons.assignment_turned_in,
              label: 'Tasks',
              tab: TimberNavTab.tasks,
              activeTab: activeTab,
              onTap: onTabSelected,
            ),
            _NavItem(
              icon: Icons.support_agent_outlined,
              activeIcon: Icons.support_agent,
              label: 'Concierge',
              tab: TimberNavTab.concierge,
              activeTab: activeTab,
              onTap: onTabSelected,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.tab,
    required this.activeTab,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final TimberNavTab tab;
  final TimberNavTab activeTab;
  final ValueChanged<TimberNavTab> onTap;

  bool get isActive => tab == activeTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(tab),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? AppColors.onPrimary : AppColors.secondary,
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              label.toUpperCase(),
              style: GoogleFonts.manrope(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
                color: isActive ? AppColors.onPrimary : AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
