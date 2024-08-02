// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  @JsonKey(name: 'kod')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'miejscowosc')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'gmina')
  String? get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'powiat')
  String? get county => throw _privateConstructorUsedError;
  @JsonKey(name: 'wojewodztwo')
  String? get voivodeship => throw _privateConstructorUsedError;
  @JsonKey(name: "ulica")
  String? get street => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {@JsonKey(name: 'kod') String? postalCode,
      @JsonKey(name: 'miejscowosc') String? city,
      @JsonKey(name: 'gmina') String? district,
      @JsonKey(name: 'powiat') String? county,
      @JsonKey(name: 'wojewodztwo') String? voivodeship,
      @JsonKey(name: "ulica") String? street});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postalCode = freezed,
    Object? city = freezed,
    Object? district = freezed,
    Object? county = freezed,
    Object? voivodeship = freezed,
    Object? street = freezed,
  }) {
    return _then(_value.copyWith(
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      voivodeship: freezed == voivodeship
          ? _value.voivodeship
          : voivodeship // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'kod') String? postalCode,
      @JsonKey(name: 'miejscowosc') String? city,
      @JsonKey(name: 'gmina') String? district,
      @JsonKey(name: 'powiat') String? county,
      @JsonKey(name: 'wojewodztwo') String? voivodeship,
      @JsonKey(name: "ulica") String? street});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postalCode = freezed,
    Object? city = freezed,
    Object? district = freezed,
    Object? county = freezed,
    Object? voivodeship = freezed,
    Object? street = freezed,
  }) {
    return _then(_$LocationImpl(
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      voivodeship: freezed == voivodeship
          ? _value.voivodeship
          : voivodeship // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {@JsonKey(name: 'kod') this.postalCode,
      @JsonKey(name: 'miejscowosc') this.city,
      @JsonKey(name: 'gmina') this.district,
      @JsonKey(name: 'powiat') this.county,
      @JsonKey(name: 'wojewodztwo') this.voivodeship,
      @JsonKey(name: "ulica") this.street});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  @JsonKey(name: 'kod')
  final String? postalCode;
  @override
  @JsonKey(name: 'miejscowosc')
  final String? city;
  @override
  @JsonKey(name: 'gmina')
  final String? district;
  @override
  @JsonKey(name: 'powiat')
  final String? county;
  @override
  @JsonKey(name: 'wojewodztwo')
  final String? voivodeship;
  @override
  @JsonKey(name: "ulica")
  final String? street;

  @override
  String toString() {
    return 'Location(postalCode: $postalCode, city: $city, district: $district, county: $county, voivodeship: $voivodeship, street: $street)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.county, county) || other.county == county) &&
            (identical(other.voivodeship, voivodeship) ||
                other.voivodeship == voivodeship) &&
            (identical(other.street, street) || other.street == street));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, postalCode, city, district, county, voivodeship, street);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {@JsonKey(name: 'kod') final String? postalCode,
      @JsonKey(name: 'miejscowosc') final String? city,
      @JsonKey(name: 'gmina') final String? district,
      @JsonKey(name: 'powiat') final String? county,
      @JsonKey(name: 'wojewodztwo') final String? voivodeship,
      @JsonKey(name: "ulica") final String? street}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  @JsonKey(name: 'kod')
  String? get postalCode;
  @override
  @JsonKey(name: 'miejscowosc')
  String? get city;
  @override
  @JsonKey(name: 'gmina')
  String? get district;
  @override
  @JsonKey(name: 'powiat')
  String? get county;
  @override
  @JsonKey(name: 'wojewodztwo')
  String? get voivodeship;
  @override
  @JsonKey(name: "ulica")
  String? get street;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
