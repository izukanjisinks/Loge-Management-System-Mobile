import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/timber_bottom_nav.dart';

class CleanerShell extends StatelessWidget {
  const CleanerShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: child,
      bottomNavigationBar: _CleanerNav(),
    );
  }
}

class _CleanerNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    final activeTab = switch (location) {
      String l when l.startsWith(RouteNames.cleanerChecklist) =>
        TimberNavTab.tasks,
      String l when l.startsWith(RouteNames.cleanerHistory) =>
        TimberNavTab.concierge,
      _ => TimberNavTab.stay,
    };

    return TimberBottomNav(
      activeTab: activeTab,
      onTabSelected: (tab) {
        switch (tab) {
          case TimberNavTab.stay:
            context.go(RouteNames.cleanerDashboard);
          case TimberNavTab.tasks:
            context.go(RouteNames.cleanerChecklist);
          case TimberNavTab.concierge:
            context.go(RouteNames.cleanerHistory);
          case TimberNavTab.dining:
            break; // no-op
        }
      },
    );
  }
}
