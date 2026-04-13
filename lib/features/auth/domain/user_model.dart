import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserRole { guest, cleaner }

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    required UserRole role,
    String? roomNumber, // only populated for guests with an active booking
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
