import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../shared/widgets/status_badge.dart';
import '../../../shared/widgets/timber_app_bar.dart';
import 'request_model.dart';
import 'requests_providers.dart';

class RequestsScreen extends ConsumerStatefulWidget {
  const RequestsScreen({super.key});

  @override
  ConsumerState<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends ConsumerState<RequestsScreen> {
  final _descriptionController = TextEditingController();
  RequestCategory? _selectedCategory;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final description = _descriptionController.text.trim();
    if (_selectedCategory == null || description.isEmpty) return;

    setState(() => _isSubmitting = true);
    await ref.read(requestsNotifierProvider.notifier).submit(
          category: _selectedCategory!,
          description: description,
        );
    setState(() {
      _isSubmitting = false;
      _selectedCategory = null;
      _descriptionController.clear();
    });
    if (mounted) FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final requestsAsync = ref.watch(requestsNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: TimberAppBar(
        leading: const Icon(Icons.menu, color: AppColors.primary),
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () =>
            ref.read(requestsNotifierProvider.notifier).refresh(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'GUEST SERVICES',
                style: GoogleFonts.manrope(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  color: AppColors.secondary,
                ),
              ),
              const Gap(8),
              Text(
                'Request Assistance',
                style: GoogleFonts.notoSerif(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const Gap(4),
              Text(
                'How can we make your stay more comfortable today?',
                style: GoogleFonts.manrope(
                  fontSize: 13,
                  color: AppColors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),

              const Gap(28),

              // Category grid
              Text(
                'CATEGORY',
                style: GoogleFonts.manrope(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  color: AppColors.secondary,
                ),
              ),
              const Gap(12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.4,
                children: RequestCategory.values
                    .map((c) => _CategoryTile(
                          category: c,
                          isSelected: _selectedCategory == c,
                          onTap: () =>
                              setState(() => _selectedCategory = c),
                        ))
                    .toList(),
              ),

              const Gap(28),

              // Request form
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Request',
                      style: GoogleFonts.notoSerif(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      'TELL US WHAT YOU NEED',
                      style: GoogleFonts.manrope(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.0,
                        color: AppColors.secondary,
                      ),
                    ),
                    const Gap(8),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 3,
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        color: AppColors.onSurface,
                      ),
                      decoration: InputDecoration(
                        hintText:
                            'Ex: Please bring extra towels to my room...',
                        hintStyle: GoogleFonts.manrope(
                          fontSize: 14,
                          color: AppColors.outline,
                        ),
                        filled: false,
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.outlineVariant,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.outlineVariant
                                .withValues(alpha: 0.5),
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                    const Gap(24),
                    PrimaryButton(
                      label: 'Submit Request',
                      onPressed: _submit,
                      isLoading: _isSubmitting,
                      isEnabled: _selectedCategory != null &&
                          _descriptionController.text.trim().isNotEmpty,
                    ),
                  ],
                ),
              ),

              const Gap(32),

              // Active requests
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Active Requests',
                    style: GoogleFonts.notoSerif(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  requestsAsync.whenOrNull(
                        data: (list) {
                          final active = list
                              .where((r) =>
                                  r.status != RequestStatus.resolved)
                              .length;
                          if (active == 0) return null;
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryContainer,
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: Text(
                              '$active Active',
                              style: GoogleFonts.manrope(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: AppColors.secondary,
                              ),
                            ),
                          );
                        },
                      ) ??
                      const SizedBox.shrink(),
                ],
              ),
              const Gap(16),

              requestsAsync.when(
                loading: () => const _RequestsListSkeleton(),
                error: (e, _) => _InlineError(
                  message: 'Could not load requests.',
                  onRetry: () => ref
                      .read(requestsNotifierProvider.notifier)
                      .refresh(),
                ),
                data: (requests) {
                  if (requests.isEmpty) {
                    return const _EmptyRequests();
                  }
                  return Column(
                    children: requests
                        .map((r) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _RequestCard(request: r),
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

// ─── Category tile ────────────────────────────────────────────────────────────

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final RequestCategory category;
  final bool isSelected;
  final VoidCallback onTap;

  IconData get _icon => switch (category) {
        RequestCategory.housekeeping => Icons.cleaning_services_outlined,
        RequestCategory.maintenance => Icons.handyman_outlined,
        RequestCategory.foodAndBeverage => Icons.restaurant_outlined,
        RequestCategory.concierge => Icons.support_agent_outlined,
      };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.outlineVariant.withValues(alpha: 0.4),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.15)
                    : AppColors.secondaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _icon,
                color: isSelected ? Colors.white : AppColors.secondary,
                size: 22,
              ),
            ),
            const Gap(8),
            Text(
              category.label,
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Request card ─────────────────────────────────────────────────────────────

class _RequestCard extends StatelessWidget {
  const _RequestCard({required this.request});

  final ServiceRequest request;

  IconData get _icon => switch (request.category) {
        RequestCategory.housekeeping => Icons.cleaning_services_outlined,
        RequestCategory.maintenance => Icons.handyman_outlined,
        RequestCategory.foodAndBeverage => Icons.restaurant_outlined,
        RequestCategory.concierge => Icons.support_agent_outlined,
      };

  BadgeStatus get _badgeStatus => switch (request.status) {
        RequestStatus.pending => BadgeStatus.pending,
        RequestStatus.inProgress => BadgeStatus.inProgress,
        RequestStatus.resolved => BadgeStatus.resolved,
      };

  @override
  Widget build(BuildContext context) {
    final isResolved = request.status == RequestStatus.resolved;
    final timeFmt = DateFormat('hh:mm a');

    return Opacity(
      opacity: isResolved ? 0.6 : 1.0,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(_icon, color: AppColors.primary, size: 20),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          request.category.label,
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const Gap(8),
                      StatusBadge(_badgeStatus),
                    ],
                  ),
                  const Gap(4),
                  Text(
                    request.description,
                    style: GoogleFonts.manrope(
                      fontSize: 13,
                      color: AppColors.onSurfaceVariant,
                      height: 1.4,
                    ),
                  ),
                  const Gap(6),
                  Text(
                    timeFmt.format(request.createdAt.toLocal()),
                    style: GoogleFonts.manrope(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: AppColors.outline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Empty / skeleton / error states ─────────────────────────────────────────

class _EmptyRequests extends StatelessWidget {
  const _EmptyRequests();

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
          Icon(Icons.inbox_outlined, size: 40, color: AppColors.outline),
          const Gap(12),
          Text(
            'No active requests',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const Gap(4),
          Text(
            'Submit one above and we\'ll get right on it.',
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: 12,
              color: AppColors.outline,
            ),
          ),
        ],
      ),
    );
  }
}

class _RequestsListSkeleton extends StatelessWidget {
  const _RequestsListSkeleton();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.surfaceContainerHigh,
      highlightColor: AppColors.surfaceContainerLowest,
      child: Column(
        children: List.generate(
          3,
          (_) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              height: 90,
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

class _InlineError extends StatelessWidget {
  const _InlineError({required this.message, required this.onRetry});

  final String message;
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
              message,
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
