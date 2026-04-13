import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_item_model.freezed.dart';

@freezed
class ChecklistItem with _$ChecklistItem {
  const factory ChecklistItem({
    required String id,
    required String label,
    required IconData icon,
    @Default(false) bool isChecked,
  }) = _ChecklistItem;
}

// Checklists vary by room type. Defined here so they can be extended
// per room type when the backend provides that data.
abstract final class RoomChecklists {
  static List<ChecklistItem> forRoomType(String roomType) {
    final lower = roomType.toLowerCase();
    if (lower.contains('suite') || lower.contains('cabin')) {
      return _extendedChecklist;
    }
    return _standardChecklist;
  }

  static final _standardChecklist = [
    const ChecklistItem(
      id: 'bed',
      label: 'Bed made & linens changed',
      icon: Icons.bed_outlined,
    ),
    const ChecklistItem(
      id: 'bathroom',
      label: 'Bathroom sanitised',
      icon: Icons.sanitizer_outlined,
    ),
    const ChecklistItem(
      id: 'floors',
      label: 'Floors swept & mopped',
      icon: Icons.cleaning_services_outlined,
    ),
    const ChecklistItem(
      id: 'towels',
      label: 'Towels & robes replaced',
      icon: Icons.dry_cleaning_outlined,
    ),
    const ChecklistItem(
      id: 'surfaces',
      label: 'Dusting & surfaces wiped',
      icon: Icons.texture_outlined,
    ),
    const ChecklistItem(
      id: 'windows',
      label: 'Windows & mirrors polished',
      icon: Icons.window_outlined,
    ),
  ];

  static final _extendedChecklist = [
    ..._standardChecklist,
    const ChecklistItem(
      id: 'minibar',
      label: 'Minibar restocked',
      icon: Icons.kitchen_outlined,
    ),
    const ChecklistItem(
      id: 'toiletries',
      label: 'Toiletries replenished',
      icon: Icons.soap_outlined,
    ),
    const ChecklistItem(
      id: 'ac',
      label: 'AC / heating set to default',
      icon: Icons.thermostat_outlined,
    ),
    const ChecklistItem(
      id: 'balcony',
      label: 'Balcony / outdoor area tidied',
      icon: Icons.deck_outlined,
    ),
  ];
}
