import 'dart:convert';

import 'package:recruitment_app/models/location/location.dart';
import 'package:http/http.dart' as http;

class LocationService {
  Future<List<Location>> fetchLocations(String postalCode) async {
    final response = await http.get(
      Uri.parse('https://kodpocztowy.intami.pl/api/$postalCode'),
      headers: {
        'Accept-Charset': 'utf-8',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((data) => Location.fromJson(data)).toList();
    } else {
      return [];
    }
  }
}
