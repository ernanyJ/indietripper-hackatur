import 'package:indietripper_v2/models/Place.dart';
import 'package:indietripper_v2/repositories/locrepositories.dart';

Future<List<Place>> getPlace(String query) async {
  var repo = LocationRepository();
  var d = await repo.findGeos(query);
  var len = d['data'];
  var len1 = len.length;
  List<Place> li = [];
  for (int i = 0; i < len1; i++) {
    var place = Place.fromJson(d, i);
    print(place.name);
    li.add(place);
  }

  return li;
}

Future<List<String>> getLatLong(String locationId) async {
  var repo = LocationRepository();
  var d = await repo.getPlaceDetails(locationId);
  List<String> latlong = [d['latitude'], d['longitude']];
  return latlong;
}
