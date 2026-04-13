import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../shared/widgets/timber_app_bar.dart';
import '../dashboard/cleaner_room_model.dart';
import '../dashboard/cleaner_rooms_providers.dart';
import 'checklist_item_model.dart';

class CleanerChecklistScreen extends ConsumerStatefulWidget {
  const CleanerChecklistScreen({super.key, required this.room});

  final CleanerRoom room;

  @override
  ConsumerState<CleanerChecklistScreen> createState() =>
      _CleanerChecklistScreenState();
}

class _CleanerChecklistScreenState
    extends ConsumerState<CleanerChecklistScreen> {
  late List<ChecklistItem> _items;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _items = RoomChecklists.forRoomType(widget.room.roomType);
  }

  bool get _allChecked => _items.every((i) => i.isChecked);
  int get _checkedCount => _items.where((i) => i.isChecked).length;

  void _toggle(int index) {
    setState(() {
      _items = List.from(_items);
      _items[index] = _items[index].copyWith(isChecked: !_items[index].isChecked);
    });
  }

  Future<void> _markAsClean() async {
    if (!_allChecked) return;
    setState(() => _isSubmitting = true);

    try {
      await ref
          .read(cleanerRoomsApiProvider)
          .markAsClean(widget.room.id);

      // Update the completed count and remove from dashboard list
      ref.read(completedTodayCountProvider.notifier).update((c) => c + 1);
      ref.read(cleanerRoomsNotifierProvider.notifier).removeRoom(widget.room.id);

      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() => _isSubmitting = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to mark as clean. Please try again.',
              style: GoogleFonts.manrope(fontWeight: FontWeight.w600),
            ),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = _items.isEmpty ? 0.0 : _checkedCount / _items.length;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: TimberAppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Room header
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Text(
                    widget.room.roomName,
                    style: GoogleFonts.notoSerif(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Text(
                  widget.room.roomType,
                  style: GoogleFonts.manrope(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),

            // Guest notes panel — only shown when notes exist
            if (widget.room.guestNotes != null) ...[
              const Gap(16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      width: 4,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.priority_high,
                      color: AppColors.primary,
                      size: 18,
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'GUEST SPECIAL NOTES',
                            style: GoogleFonts.manrope(
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5,
                              color: AppColors.primary,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            widget.room.guestNotes!,
                            style: GoogleFonts.manrope(
                              fontSize: 13,
                              color: AppColors.onSurface,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const Gap(24),

            // Progress bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cleaning Progress',
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                Text(
                  '$_checkedCount of ${_items.length} tasks',
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const Gap(10),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: AppColors.surfaceContainer,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),

            const Gap(24),

            // Checklist items
            ...List.generate(
              _items.length,
              (i) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ChecklistTile(
                  item: _items[i],
                  onToggle: () => _toggle(i),
                ),
              ),
            ),

            const Gap(24),

            // Mark as clean button
            PrimaryButton(
              label: 'Mark as Clean',
              icon: Icons.task_alt_outlined,
              onPressed: _markAsClean,
              isLoading: _isSubmitting,
              isEnabled: _allChecked,
            ),

            if (!_allChecked) ...[
              const Gap(12),
              Center(
                child: Text(
                  'COMPLETE ALL TASKS TO SUBMIT',
                  style: GoogleFonts.manrope(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: AppColors.outline,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Checklist tile ───────────────────────────────────────────────────────────

class _ChecklistTile extends StatelessWidget {
  const _ChecklistTile({required this.item, required this.onToggle});

  final ChecklistItem item;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Custom checkbox
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: item.isChecked ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: item.isChecked
                      ? AppColors.primary
                      : AppColors.outlineVariant,
                  width: 2,
                ),
              ),
              child: item.isChecked
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),
            const Gap(16),
            Expanded(
              child: Text(
                item.label,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: item.isChecked
                      ? AppColors.onSurface.withValues(alpha: 0.4)
                      : AppColors.onSurface,
                  decoration: item.isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
            Icon(
              item.icon,
              size: 20,
              color: AppColors.outlineVariant,
            ),
          ],
        ),
      ),
    );
  }
}
