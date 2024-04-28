import '../constants/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationRepository {
  Future<Map<String, dynamic>> findAttractions(
      String query, List<String> latLong) async {
    final url = Uri.parse(
        'https://api.content.tripadvisor.com/api/v1/location/search?key=$API_KEY&searchQuery=$query&category=attractions&latLong=${latLong[0]}%2C%20${latLong[1]}&language=pt');

    final headers = {
      'accept': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    final mapJson = jsonDecode(response.body);
    return mapJson;
  }

  Future<Map<String, dynamic>> findRestaurants(
      String query, List<String> latLong) async {
    final url = Uri.parse(
        'https://api.content.tripadvisor.com/api/v1/location/search?key=$API_KEY&searchQuery=$query&category=restaurants&latLong=${latLong[0]}%2C%20${latLong[1]}&language=pt');

    final headers = {
      'accept': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    final mapJson = jsonDecode(response.body);
    return mapJson;
  }

  Future<Map<String, dynamic>> findHotels(
      String query, List<String> latLong) async {
    final url = Uri.parse(
        'https://api.content.tripadvisor.com/api/v1/location/search?key=$API_KEY&searchQuery=$query&category=Hotels&latLong=${latLong[0]}%2C%20${latLong[1]}&language=pt');

    final headers = {
      'accept': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    final mapJson = jsonDecode(response.body);
    return mapJson;
  }

  Future<Map<String, dynamic>> findGeos(String query) async {
    final url = Uri.parse(
        'https://api.content.tripadvisor.com/api/v1/location/search?key=$API_KEY&searchQuery=$query&category=geos&language=en_US');

    final headers = {
      'accept': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    final mapJson = jsonDecode(response.body);
    return mapJson;
  }

  Future<Map<String, dynamic>> getPlaceDetails(String locationId) async {
    final url = Uri.parse(
        'https://api.content.tripadvisor.com/api/v1/location/$locationId/details?key=$API_KEY');
    final headers = {
      'accept': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    final mapJson = jsonDecode(response.body);
    return mapJson;
  }
}



/*

  PEGAR LAT_LONG A PARTIR DO getPlaceDetails():


  var placeDetails = await repo.getPlaceDetails(locationId);
  List<String> latLong = [placeDetails['latitude'], placeDetails['longitude']];

  
  DADOS DE FIND(CATEGORY):
  ${rest['data'][i]['name']}
  ${rest['data'][i]['address_obj']['address_string']}


*/