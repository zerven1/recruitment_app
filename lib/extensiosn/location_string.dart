import 'package:recruitment_app/models/location/location.dart';

extension LocationString on Location {
  String get locationString {
    List<String> parts = [
      if (street != null && street!.isNotEmpty) street!,
      if (city != null && city!.isNotEmpty) city!,
      if (district != null && district!.isNotEmpty) district!,
      if (county != null && county!.isNotEmpty) county!,
      if (voivodeship != null && voivodeship!.isNotEmpty) voivodeship!,
      if (postalCode != null && postalCode!.isNotEmpty) postalCode!
    ];
    return parts.join(', ');
  }

  String get locationStringFirstPart {
    List<String> parts = [
      if (postalCode != null && postalCode!.isNotEmpty) postalCode!,
      if (street != null && street!.isNotEmpty) street!,
      if (city != null && city!.isNotEmpty) city!,
    ];
    return parts.join(', ');
  }

  String get locationStringSecondPart {
    List<String> parts = [
      if (district != null && district!.isNotEmpty) district!,
      if (county != null && county!.isNotEmpty) county!,
      if (voivodeship != null && voivodeship!.isNotEmpty) voivodeship!,
    ];
    return parts.join(', ');
  }
}
