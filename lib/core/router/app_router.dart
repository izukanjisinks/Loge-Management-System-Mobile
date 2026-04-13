import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/domain/user_model.dart';
import '../../features/auth/presentation/auth_providers.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/cleaner/dashboard/cleaner_shell.dart';
import '../../features/guest/dashboard/guest_dashboard_screen.dart';
import '../../features/guest/dashboard/guest_shell.dart';
import '../../features/guest/requests/requests_screen.dart';
import 'route_names.dart';

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
    refreshListenable: _AuthStateListenable(ref),
    redirect: (context, state) {
      final authAsync = ref.read(authNotifierProvider);

      // Still restoring session — stay put
      if (authAsync.isLoading) return null;

      final authState = authAsync.valueOrNull;
      final isOnLogin = state.matchedLocation == RouteNames.login;

      // No state or error → send to login
      if (authState == null || authAsync.hasError) {
        return isOnLogin ? null : RouteNames.login;
      }

      return authState.when(
        initial: () => null,
        unauthenticated: () => isOnLogin ? null : RouteNames.login,
        authenticated: (user) {
          // On login screen while authenticated → redirect to correct dashboard
          if (isOnLogin) {
            return user.role == UserRole.cleaner
                ? RouteNames.cleanerDashboard
                : RouteNames.guestDashboard;
          }
          // Role boundary enforcement
          final onGuestRoute = state.matchedLocation.startsWith('/guest');
          final onCleanerRoute = state.matchedLocation.startsWith('/cleaner');
          if (user.role == UserRole.cleaner && onGuestRoute) {
            return RouteNames.cleanerDashboard;
          }
          if (user.role == UserRole.guest && onCleanerRoute) {
            return RouteNames.guestDashboard;
          }
          return null;
        },
      );
    },
    routes: [
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),

      // Guest shell
      ShellRoute(
        builder: (context, state, child) => GuestShell(child: child),
        routes: [
          GoRoute(
            path: RouteNames.guestDashboard,
            name: RouteNames.guestDashboard,
            builder: (context, state) => const GuestDashboardScreen(),
          ),
          GoRoute(
            path: RouteNames.guestRequests,
            name: RouteNames.guestRequests,
            builder: (context, state) => const RequestsScreen(),
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
        builder: (context, state, child) => CleanerShell(child: child),
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

// Bridges Riverpod auth state changes into go_router's Listenable refresh
class _AuthStateListenable extends ChangeNotifier {
  _AuthStateListenable(Ref ref) {
    ref.listen(authNotifierProvider, (prev, next) => notifyListeners());
  }
}
