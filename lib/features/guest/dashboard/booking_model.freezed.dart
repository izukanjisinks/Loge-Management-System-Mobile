// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return _Booking.fromJson(json);
}

/// @nodoc
mixin _$Booking {
  String get id => throw _privateConstructorUsedError;
  String get roomNumber => throw _privateConstructorUsedError;
  String get roomName => throw _privateConstructorUsedError;
  String get roomType => throw _privateConstructorUsedError;
  DateTime get checkIn => throw _privateConstructorUsedError;
  DateTime get checkOut => throw _privateConstructorUsedError;
  String get mealPlan => throw _privateConstructorUsedError;
  String? get roomImageUrl => throw _privateConstructorUsedError;
  String? get guestNotes => throw _privateConstructorUsedError;

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call({
    String id,
    String roomNumber,
    String roomName,
    String roomType,
    DateTime checkIn,
    DateTime checkOut,
    String mealPlan,
    String? roomImageUrl,
    String? guestNotes,
  });
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomNumber = null,
    Object? roomName = null,
    Object? roomType = null,
    Object? checkIn = null,
    Object? checkOut = null,
    Object? mealPlan = null,
    Object? roomImageUrl = freezed,
    Object? guestNotes = freezed,
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
            checkIn: null == checkIn
                ? _value.checkIn
                : checkIn // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            checkOut: null == checkOut
                ? _value.checkOut
                : checkOut // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            mealPlan: null == mealPlan
                ? _value.mealPlan
                : mealPlan // ignore: cast_nullable_to_non_nullable
                      as String,
            roomImageUrl: freezed == roomImageUrl
                ? _value.roomImageUrl
                : roomImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            guestNotes: freezed == guestNotes
                ? _value.guestNotes
                : guestNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingImplCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$BookingImplCopyWith(
    _$BookingImpl value,
    $Res Function(_$BookingImpl) then,
  ) = __$$BookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String roomNumber,
    String roomName,
    String roomType,
    DateTime checkIn,
    DateTime checkOut,
    String mealPlan,
    String? roomImageUrl,
    String? guestNotes,
  });
}

/// @nodoc
class __$$BookingImplCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$BookingImpl>
    implements _$$BookingImplCopyWith<$Res> {
  __$$BookingImplCopyWithImpl(
    _$BookingImpl _value,
    $Res Function(_$BookingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomNumber = null,
    Object? roomName = null,
    Object? roomType = null,
    Object? checkIn = null,
    Object? checkOut = null,
    Object? mealPlan = null,
    Object? roomImageUrl = freezed,
    Object? guestNotes = freezed,
  }) {
    return _then(
      _$BookingImpl(
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
        checkIn: null == checkIn
            ? _value.checkIn
            : checkIn // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        checkOut: null == checkOut
            ? _value.checkOut
            : checkOut // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        mealPlan: null == mealPlan
            ? _value.mealPlan
            : mealPlan // ignore: cast_nullable_to_non_nullable
                  as String,
        roomImageUrl: freezed == roomImageUrl
            ? _value.roomImageUrl
            : roomImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        guestNotes: freezed == guestNotes
            ? _value.guestNotes
            : guestNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingImpl implements _Booking {
  const _$BookingImpl({
    required this.id,
    required this.roomNumber,
    required this.roomName,
    required this.roomType,
    required this.checkIn,
    required this.checkOut,
    required this.mealPlan,
    this.roomImageUrl,
    this.guestNotes,
  });

  factory _$BookingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingImplFromJson(json);

  @override
  final String id;
  @override
  final String roomNumber;
  @override
  final String roomName;
  @override
  final String roomType;
  @override
  final DateTime checkIn;
  @override
  final DateTime checkOut;
  @override
  final String mealPlan;
  @override
  final String? roomImageUrl;
  @override
  final String? guestNotes;

  @override
  String toString() {
    return 'Booking(id: $id, roomNumber: $roomNumber, roomName: $roomName, roomType: $roomType, checkIn: $checkIn, checkOut: $checkOut, mealPlan: $mealPlan, roomImageUrl: $roomImageUrl, guestNotes: $guestNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomNumber, roomNumber) ||
                other.roomNumber == roomNumber) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.roomType, roomType) ||
                other.roomType == roomType) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.mealPlan, mealPlan) ||
                other.mealPlan == mealPlan) &&
            (identical(other.roomImageUrl, roomImageUrl) ||
                other.roomImageUrl == roomImageUrl) &&
            (identical(other.guestNotes, guestNotes) ||
                other.guestNotes == guestNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roomNumber,
    roomName,
    roomType,
    checkIn,
    checkOut,
    mealPlan,
    roomImageUrl,
    guestNotes,
  );

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      __$$BookingImplCopyWithImpl<_$BookingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingImplToJson(this);
  }
}

abstract class _Booking implements Booking {
  const factory _Booking({
    required final String id,
    required final String roomNumber,
    required final String roomName,
    required final String roomType,
    required final DateTime checkIn,
    required final DateTime checkOut,
    required final String mealPlan,
    final String? roomImageUrl,
    final String? guestNotes,
  }) = _$BookingImpl;

  factory _Booking.fromJson(Map<String, dynamic> json) = _$BookingImpl.fromJson;

  @override
  String get id;
  @override
  String get roomNumber;
  @override
  String get roomName;
  @override
  String get roomType;
  @override
  DateTime get checkIn;
  @override
  DateTime get checkOut;
  @override
  String get mealPlan;
  @override
  String? get roomImageUrl;
  @override
  String? get guestNotes;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
