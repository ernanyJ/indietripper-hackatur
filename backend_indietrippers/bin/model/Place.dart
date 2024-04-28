class Place {
  String? name;
  String? imgUrl;
  dynamic averageRating;
  String? priceTag;
  List<dynamic> tags;

  Place(
      {required this.name,
      required this.imgUrl,
      required this.averageRating,
      required this.priceTag,
      required this.tags});

// fabrica
  factory Place.fromJson(Map<String, dynamic> response, int id) => Place(
      name: response['data']['data'][id]['name'],
      imgUrl: response['data']['data'][id]['heroImgUrl'],
      averageRating: response['data']['data'][id]['averageRating'],
      priceTag: response['data']['data'][id]['priceTag'],
      tags: response['data']['data'][id]['establishmentTypeAndCuisineTags']);
}
