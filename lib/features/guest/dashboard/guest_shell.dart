import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/timber_bottom_nav.dart';

class GuestShell extends StatelessWidget {
  const GuestShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: child,
      bottomNavigationBar: _GuestNav(),
    );
  }
}

class _GuestNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    final activeTab = switch (location) {
      String l when l.startsWith(RouteNames.guestRequests) =>
        TimberNavTab.tasks,
      String l when l.startsWith(RouteNames.guestRating) =>
        TimberNavTab.concierge,
      _ => TimberNavTab.stay,
    };

    return TimberBottomNav(
      activeTab: activeTab,
      onTabSelected: (tab) {
        switch (tab) {
          case TimberNavTab.stay:
            context.go(RouteNames.guestDashboard);
          case TimberNavTab.tasks:
            context.go(RouteNames.guestRequests);
          case TimberNavTab.concierge:
            context.go(RouteNames.guestRating);
          case TimberNavTab.dining:
            break; // Phase 2 — no-op for now
        }
      },
    );
  }
}
