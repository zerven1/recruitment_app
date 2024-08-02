// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      postalCode: json['kod'] as String?,
      city: json['miejscowosc'] as String?,
      district: json['gmina'] as String?,
      county: json['powiat'] as String?,
      voivodeship: json['wojewodztwo'] as String?,
      street: json['ulica'] as String?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'kod': instance.postalCode,
      'miejscowosc': instance.city,
      'gmina': instance.district,
      'powiat': instance.county,
      'wojewodztwo': instance.voivodeship,
      'ulica': instance.street,
    };
