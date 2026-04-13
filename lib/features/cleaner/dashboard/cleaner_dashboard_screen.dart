import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../features/auth/presentation/auth_providers.dart';
import '../../../shared/widgets/status_badge.dart';
import '../../../shared/widgets/timber_app_bar.dart';
import 'cleaner_room_model.dart';
import 'cleaner_rooms_providers.dart';

class CleanerDashboardScreen extends ConsumerStatefulWidget {
  const CleanerDashboardScreen({super.key});

  @override
  ConsumerState<CleanerDashboardScreen> createState() =>
      _CleanerDashboardScreenState();
}

class _CleanerDashboardScreenState
    extends ConsumerState<CleanerDashboardScreen> {
  late Timer _clockTimer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider.notifier).currentUser;
    final roomsAsync = ref.watch(cleanerRoomsNotifierProvider);
    final assigned = ref.watch(assignedCountProvider);
    final needsCleaning = ref.watch(needsCleaningCountProvider);
    final completed = ref.watch(completedTodayCountProvider);

    final firstName = user?.name.split(' ').first ?? 'there';
    final hour = _now.hour;
    final greeting = hour < 12
        ? 'Good Morning,'
        : hour < 17
            ? 'Good Afternoon,'
            : 'Good Evening,';

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: TimberAppBar(
        leading: const Icon(Icons.menu, color: AppColors.primary),
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () =>
            ref.read(cleanerRoomsNotifierProvider.notifier).refresh(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shift greeting + live clock
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CURRENT SHIFT',
                          style: GoogleFonts.manrope(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                            color: AppColors.secondary,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          '$greeting\n$firstName',
                          style: GoogleFonts.notoSerif(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('HH:mm').format(_now),
                        style: GoogleFonts.notoSerif(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary.withValues(alpha: 0.35),
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        DateFormat('EEEE, MMM d').format(_now).toUpperCase(),
                        style: GoogleFonts.manrope(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Gap(28),

              // Stats bento grid
              Row(
                children: [
                  // Assigned — large square
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: _StatCard(
                        value: assigned,
                        label: 'Assigned',
                        icon: Icons.assignment_turned_in_outlined,
                        backgroundColor: AppColors.surfaceContainerLowest,
                        valueColor: AppColors.primary,
                        iconColor: AppColors.secondary,
                      ),
                    ),
                  ),
                  const Gap(12),
                  // Needs cleaning + completed stacked
                  Expanded(
                    child: Column(
                      children: [
                        _StatCard(
                          value: needsCleaning,
                          label: 'Needs Cleaning',
                          icon: Icons.cleaning_services_outlined,
                          backgroundColor: AppColors.primary,
                          valueColor: AppColors.onPrimary,
                          iconColor: AppColors.onPrimary.withValues(alpha: 0.4),
                          compact: true,
                        ),
                        const Gap(12),
                        _StatCard(
                          value: completed,
                          label: 'Completed',
                          icon: Icons.check_circle_outline,
                          backgroundColor: AppColors.secondaryContainer,
                          valueColor: AppColors.onSecondaryContainer,
                          iconColor: AppColors.onSecondaryContainer
                              .withValues(alpha: 0.4),
                          compact: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Gap(28),

              // Priority room list
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Priority Rooms',
                    style: GoogleFonts.notoSerif(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.filter_list,
                          size: 14, color: AppColors.secondary),
                      const Gap(4),
                      Text(
                        'SORT: STATUS',
                        style: GoogleFonts.manrope(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(16),

              roomsAsync.when(
                loading: () => const _RoomListSkeleton(),
                error: (e, _) => _ErrorCard(
                  onRetry: () =>
                      ref.read(cleanerRoomsNotifierProvider.notifier).refresh(),
                ),
                data: (rooms) {
                  if (rooms.isEmpty) return const _EmptyRooms();
                  return Column(
                    children: rooms
                        .map((room) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _RoomCard(room: room),
                            ))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Stat card ───────────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.value,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.valueColor,
    required this.iconColor,
    this.compact = false,
  });

  final int value;
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color valueColor;
  final Color iconColor;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(compact ? 16 : 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: compact
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$value',
                      style: GoogleFonts.notoSerif(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: valueColor,
                      ),
                    ),
                    Text(
                      label.toUpperCase(),
                      style: GoogleFonts.manrope(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                        color: valueColor.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
                Icon(icon, color: iconColor, size: 28),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: iconColor, size: 24),
                const Gap(16),
                Text(
                  '$value',
                  style: GoogleFonts.notoSerif(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: valueColor,
                  ),
                ),
                Text(
                  label.toUpperCase(),
                  style: GoogleFonts.manrope(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
    );
  }
}

// ─── Room card ───────────────────────────────────────────────────────────────

class _RoomCard extends ConsumerWidget {
  const _RoomCard({required this.room});

  final CleanerRoom room;

  Color get _borderColor => switch (room.priority) {
        RoomPriority.checkout => AppColors.error,
        RoomPriority.notReady => AppColors.outlineVariant,
        RoomPriority.stayOver => AppColors.secondary,
      };

  BadgeStatus get _badgeStatus => switch (room.priority) {
        RoomPriority.checkout => BadgeStatus.checkout,
        RoomPriority.notReady => BadgeStatus.notReady,
        RoomPriority.stayOver => BadgeStatus.stayOver,
      };

  bool get _canOpen => room.priority != RoomPriority.notReady;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(color: _borderColor, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      StatusBadge(_badgeStatus),
                      if (room.priority == RoomPriority.checkout) ...[
                        const Gap(6),
                        Text(
                          'Priority',
                          style: GoogleFonts.manrope(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: AppColors.secondary.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const Gap(6),
                  Text(
                    room.roomName,
                    style: GoogleFonts.notoSerif(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      Icon(
                        room.priority == RoomPriority.notReady
                            ? Icons.lock_clock_outlined
                            : Icons.schedule_outlined,
                        size: 13,
                        color: AppColors.onSurfaceVariant,
                      ),
                      const Gap(4),
                      Text(
                        room.priority == RoomPriority.notReady
                            ? 'Guest still in-room'
                            : room.cleanByTime != null
                                ? 'Clean by ${room.cleanByTime}'
                                : 'Daily refresh requested',
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(12),
            GestureDetector(
              onTap: _canOpen
                  ? () => context.push(
                        RouteNames.cleanerChecklist,
                        extra: room,
                      )
                  : null,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.chevron_right,
                  color: _canOpen
                      ? AppColors.primary
                      : AppColors.primary.withValues(alpha: 0.25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Empty / skeleton / error ─────────────────────────────────────────────────

class _EmptyRooms extends StatelessWidget {
  const _EmptyRooms();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Icon(Icons.check_circle_outline,
              size: 40, color: AppColors.secondary),
          const Gap(12),
          Text(
            'All rooms complete!',
            style: GoogleFonts.notoSerif(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const Gap(4),
          Text(
            'Great work today.',
            style: GoogleFonts.manrope(
              fontSize: 13,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _RoomListSkeleton extends StatelessWidget {
  const _RoomListSkeleton();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.surfaceContainerHigh,
      highlightColor: AppColors.surfaceContainerLowest,
      child: Column(
        children: List.generate(
          4,
          (_) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              height: 88,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.errorContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: AppColors.onErrorContainer),
          const Gap(12),
          Expanded(
            child: Text(
              'Could not load room assignments.',
              style: GoogleFonts.manrope(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.onErrorContainer,
              ),
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: Text(
              'Retry',
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
