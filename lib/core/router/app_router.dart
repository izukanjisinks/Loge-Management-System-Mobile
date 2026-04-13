import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/login_screen.dart';
import 'route_names.dart';

// Placeholder screens — replaced as each phase is built
class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(label, style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.login,
    redirect: (context, state) async {
      // Auth guard will be wired in Phase 1
      // For now just allow all navigation
      return null;
    },
    routes: [
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),

      // Guest shell
      ShellRoute(
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            path: RouteNames.guestDashboard,
            name: RouteNames.guestDashboard,
            builder: (context, state) =>
                const _PlaceholderScreen('Guest Dashboard'),
          ),
          GoRoute(
            path: RouteNames.guestRequests,
            name: RouteNames.guestRequests,
            builder: (context, state) =>
                const _PlaceholderScreen('Room Service Requests'),
          ),
          GoRoute(
            path: RouteNames.guestRating,
            name: RouteNames.guestRating,
            builder: (context, state) =>
                const _PlaceholderScreen('Stay Rating'),
          ),
        ],
      ),

      // Cleaner shell
      ShellRoute(
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            path: RouteNames.cleanerDashboard,
            name: RouteNames.cleanerDashboard,
            builder: (context, state) =>
                const _PlaceholderScreen('Cleaner Dashboard'),
          ),
          GoRoute(
            path: RouteNames.cleanerChecklist,
            name: RouteNames.cleanerChecklist,
            builder: (context, state) =>
                const _PlaceholderScreen('Cleaning Checklist'),
          ),
          GoRoute(
            path: RouteNames.cleanerSupplies,
            name: RouteNames.cleanerSupplies,
            builder: (context, state) =>
                const _PlaceholderScreen('Supply Requests'),
          ),
          GoRoute(
            path: RouteNames.cleanerHistory,
            name: RouteNames.cleanerHistory,
            builder: (context, state) =>
                const _PlaceholderScreen('Cleaning History'),
          ),
        ],
      ),
    ],
  );
});
