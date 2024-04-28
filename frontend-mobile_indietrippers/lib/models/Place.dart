class Place {
  String? name;
  String? addressString;
  String? locationId;
  List<String>? latLong;

  Place({required this.name, required this.addressString, this.locationId});

  factory Place.fromJson(Map<String, dynamic> response, int id) => Place(
      name: response['data'][id]['name'],
      addressString: response['data'][id]['address_obj']['address_string'],
      locationId: response['data'][id]['location_id']);
}
