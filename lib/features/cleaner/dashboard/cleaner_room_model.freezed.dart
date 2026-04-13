// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cleaner_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CleanerRoom _$CleanerRoomFromJson(Map<String, dynamic> json) {
  return _CleanerRoom.fromJson(json);
}

/// @nodoc
mixin _$CleanerRoom {
  String get id => throw _privateConstructorUsedError;
  String get roomNumber => throw _privateConstructorUsedError;
  String get roomName => throw _privateConstructorUsedError;
  String get roomType => throw _privateConstructorUsedError;
  RoomPriority get priority => throw _privateConstructorUsedError;
  String? get cleanByTime =>
      throw _privateConstructorUsedError; // e.g. "11:00 AM" — shown for checkout rooms
  String? get guestNotes =>
      throw _privateConstructorUsedError; // special notes from front desk
  String? get roomImageUrl => throw _privateConstructorUsedError;
  bool? get guestInRoom => throw _privateConstructorUsedError;

  /// Serializes this CleanerRoom to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CleanerRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CleanerRoomCopyWith<CleanerRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CleanerRoomCopyWith<$Res> {
  factory $CleanerRoomCopyWith(
    CleanerRoom value,
    $Res Function(CleanerRoom) then,
  ) = _$CleanerRoomCopyWithImpl<$Res, CleanerRoom>;
  @useResult
  $Res call({
    String id,
    String roomNumber,
    String roomName,
    String roomType,
    RoomPriority priority,
    String? cleanByTime,
    String? guestNotes,
    String? roomImageUrl,
    bool? guestInRoom,
  });
}

/// @nodoc
class _$CleanerRoomCopyWithImpl<$Res, $Val extends CleanerRoom>
    implements $CleanerRoomCopyWith<$Res> {
  _$CleanerRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CleanerRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomNumber = null,
    Object? roomName = null,
    Object? roomType = null,
    Object? priority = null,
    Object? cleanByTime = freezed,
    Object? guestNotes = freezed,
    Object? roomImageUrl = freezed,
    Object? guestInRoom = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            roomNumber: null == roomNumber
                ? _value.roomNumber
                : roomNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            roomName: null == roomName
                ? _value.roomName
                : roomName // ignore: cast_nullable_to_non_nullable
                      as String,
            roomType: null == roomType
                ? _value.roomType
                : roomType // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as RoomPriority,
            cleanByTime: freezed == cleanByTime
                ? _value.cleanByTime
                : cleanByTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            guestNotes: freezed == guestNotes
                ? _value.guestNotes
                : guestNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            roomImageUrl: freezed == roomImageUrl
                ? _value.roomImageUrl
                : roomImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            guestInRoom: freezed == guestInRoom
                ? _value.guestInRoom
                : guestInRoom // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CleanerRoomImplCopyWith<$Res>
    implements $CleanerRoomCopyWith<$Res> {
  factory _$$CleanerRoomImplCopyWith(
    _$CleanerRoomImpl value,
    $Res Function(_$CleanerRoomImpl) then,
  ) = __$$CleanerRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String roomNumber,
    String roomName,
    String roomType,
    RoomPriority priority,
    String? cleanByTime,
    String? guestNotes,
    String? roomImageUrl,
    bool? guestInRoom,
  });
}

/// @nodoc
class __$$CleanerRoomImplCopyWithImpl<$Res>
    extends _$CleanerRoomCopyWithImpl<$Res, _$CleanerRoomImpl>
    implements _$$CleanerRoomImplCopyWith<$Res> {
  __$$CleanerRoomImplCopyWithImpl(
    _$CleanerRoomImpl _value,
    $Res Function(_$CleanerRoomImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CleanerRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomNumber = null,
    Object? roomName = null,
    Object? roomType = null,
    Object? priority = null,
    Object? cleanByTime = freezed,
    Object? guestNotes = freezed,
    Object? roomImageUrl = freezed,
    Object? guestInRoom = freezed,
  }) {
    return _then(
      _$CleanerRoomImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        roomNumber: null == roomNumber
            ? _value.roomNumber
            : roomNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        roomName: null == roomName
            ? _value.roomName
            : roomName // ignore: cast_nullable_to_non_nullable
                  as String,
        roomType: null == roomType
            ? _value.roomType
            : roomType // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as RoomPriority,
        cleanByTime: freezed == cleanByTime
            ? _value.cleanByTime
            : cleanByTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        guestNotes: freezed == guestNotes
            ? _value.guestNotes
            : guestNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        roomImageUrl: freezed == roomImageUrl
            ? _value.roomImageUrl
            : roomImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        guestInRoom: freezed == guestInRoom
            ? _value.guestInRoom
            : guestInRoom // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CleanerRoomImpl implements _CleanerRoom {
  const _$CleanerRoomImpl({
    required this.id,
    required this.roomNumber,
    required this.roomName,
    required this.roomType,
    required this.priority,
    this.cleanByTime,
    this.guestNotes,
    this.roomImageUrl,
    this.guestInRoom,
  });

  factory _$CleanerRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$CleanerRoomImplFromJson(json);

  @override
  final String id;
  @override
  final String roomNumber;
  @override
  final String roomName;
  @override
  final String roomType;
  @override
  final RoomPriority priority;
  @override
  final String? cleanByTime;
  // e.g. "11:00 AM" — shown for checkout rooms
  @override
  final String? guestNotes;
  // special notes from front desk
  @override
  final String? roomImageUrl;
  @override
  final bool? guestInRoom;

  @override
  String toString() {
    return 'CleanerRoom(id: $id, roomNumber: $roomNumber, roomName: $roomName, roomType: $roomType, priority: $priority, cleanByTime: $cleanByTime, guestNotes: $guestNotes, roomImageUrl: $roomImageUrl, guestInRoom: $guestInRoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CleanerRoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomNumber, roomNumber) ||
                other.roomNumber == roomNumber) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.roomType, roomType) ||
                other.roomType == roomType) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.cleanByTime, cleanByTime) ||
                other.cleanByTime == cleanByTime) &&
            (identical(other.guestNotes, guestNotes) ||
                other.guestNotes == guestNotes) &&
            (identical(other.roomImageUrl, roomImageUrl) ||
                other.roomImageUrl == roomImageUrl) &&
            (identical(other.guestInRoom, guestInRoom) ||
                other.guestInRoom == guestInRoom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roomNumber,
    roomName,
    roomType,
    priority,
    cleanByTime,
    guestNotes,
    roomImageUrl,
    guestInRoom,
  );

  /// Create a copy of CleanerRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CleanerRoomImplCopyWith<_$CleanerRoomImpl> get copyWith =>
      __$$CleanerRoomImplCopyWithImpl<_$CleanerRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CleanerRoomImplToJson(this);
  }
}

abstract class _CleanerRoom implements CleanerRoom {
  const factory _CleanerRoom({
    required final String id,
    required final String roomNumber,
    required final String roomName,
    required final String roomType,
    required final RoomPriority priority,
    final String? cleanByTime,
    final String? guestNotes,
    final String? roomImageUrl,
    final bool? guestInRoom,
  }) = _$CleanerRoomImpl;

  factory _CleanerRoom.fromJson(Map<String, dynamic> json) =
      _$CleanerRoomImpl.fromJson;

  @override
  String get id;
  @override
  String get roomNumber;
  @override
  String get roomName;
  @override
  String get roomType;
  @override
  RoomPriority get priority;
  @override
  String? get cleanByTime; // e.g. "11:00 AM" — shown for checkout rooms
  @override
  String? get guestNotes; // special notes from front desk
  @override
  String? get roomImageUrl;
  @override
  bool? get guestInRoom;

  /// Create a copy of CleanerRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CleanerRoomImplCopyWith<_$CleanerRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
