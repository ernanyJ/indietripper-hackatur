import 'dart:convert';
import 'dart:io';
import 'repositories/location_repository.dart';

void main(List<String> arguments) async {
  LocationRepository repo = LocationRepository();
  print("Olá, Bem vindo ao Cedro-Tour!\n");
  print("Para onde iremos viajar? ");
  String? queryString = stdin.readLineSync();

  print("Qual desses lugares é oque você busca? ");
  var body = await repo.findGeos(queryString!);
  var len = body['data'];
  var len1 = len.length;
  for (int i = 0; i < len1; i++) {
    print(
        '''
    $i)
    ${body['data'][i]['name']}
    ${body['data'][i]['address_obj']['address_string']}

''');
  }

  String? option = stdin.readLineSync();

  var locationId = body['data'][int.parse(option!)]['location_id'];

  var placeDetails = await repo.getPlaceDetails(locationId);

  List<String> latLong = [placeDetails['latitude'], placeDetails['longitude']];

  print(
      "Muito bem! ${body['data'][int.parse(option)]['name']} é um ótimo lugar.");
  print("Oque você deseja fazer lá primeiro?");

  print(
      '''

  1) Quero ir em algum restaurante!
  2) Quero ir em alguma atração.
  3) Quero primeiro buscar um hotel.

''');

  String? placeOption = stdin.readLineSync();

  switch (int.parse(placeOption!)) {
    case 1:
      print(
          "Aqui estão algumas opções de restaurantes em ${body['data'][int.parse(option)]['name']}:");
      var rest = await repo.findRestaurants("Restaurantes", latLong);
      var restlen = body['data'];
      var restlen1 = restlen.length;
      for (int i = 0; i < restlen1; i++) {
        print(
            '''
      ${i + 1})
      ${rest['data'][i]['name']}
      ${rest['data'][i]['address_obj']['address_string']}

      ''');
      }

      break;
    case 2:
      print(
          "Aqui estão algumas opções de atrações em ${body['data'][int.parse(option)]['name']}:");
      var rest = await repo.findAttractions("Atrações", latLong);
      var restlen = body['data'];
      var restlen1 = restlen.length;
      if (restlen1 != 0) {
        for (int i = 0; i < restlen1; i++) {
          print(
              '''
      ${i + 1})
      ${rest['data'][i]['name']}
      ${rest['data'][i]['address_obj']['address_string']}

      ''');
        }
      }

      break;

    case 3:
      print(
          "Aqui estão algumas opções de hóteis em ${body['data'][int.parse(option)]['name']}:");
      var rest = await repo.findHotels("hotels", latLong);
      var restlen = body['data'];
      var restlen1 = restlen.length;
      for (int i = 0; i < restlen1; i++) {
        print(
            '''
      ${i + 1})
      ${rest['data'][i]['name']}
      ${rest['data'][i]['address_obj']['address_string']}

      ''');
      }
  }
}
