import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    @JsonKey(name: 'kod') String? postalCode,
    @JsonKey(name: 'miejscowosc') String? city,
    @JsonKey(name: 'gmina') String? district,
    @JsonKey(name: 'powiat') String? county,
    @JsonKey(name: 'wojewodztwo') String? voivodeship,
    @JsonKey(name: "ulica") String? street,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}
