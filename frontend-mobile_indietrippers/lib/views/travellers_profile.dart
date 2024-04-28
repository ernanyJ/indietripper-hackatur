import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indietripper_v2/constants/constants.dart';
import 'package:indietripper_v2/controllers/PlaceController.dart';
import 'package:indietripper_v2/repositories/locrepositories.dart';
import 'package:indietripper_v2/widgets/default_app_bar.dart';

import '../models/Place.dart';
import 'where_you_go.dart';

Widget TravellersProfile(var b) {
  var latLong = b;
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      backgroundColor: mainColor,
      onPressed: () {
        Get.dialog(FinancialQuestion());
      },
      child: const Icon(
        Icons.arrow_forward_sharp,
        color: Colors.white,
      ),
    ),
    appBar: defaultAppBar("Geração de roteiros"),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Vamos entender seu perfil agora!",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: mainColor, fontSize: 25),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            "1. Que tipo de viajante você é?",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OptionTile("Explorador"),
              OptionTile("Aventureiro"),
              OptionTile("Gastrônomia"),
              OptionTile("Business"),
              OptionTile("Relaxante"),
            ],
          ),
        )
      ],
    ),
  );
}

FinancialQuestion() {
  var ctrl = TextEditingController();
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      backgroundColor: mainColor,
      onPressed: () {
        Get.dialog((FinancialQuestionPT2(ctrl.text)));
      },
      child: const Icon(
        Icons.arrow_forward_sharp,
        color: Colors.white,
      ),
    ),
    appBar: defaultAppBar("Geração de roteiros"),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Mais algumas perguntas",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: mainColor, fontSize: 25),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            "2. Qual seu orçamento?",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ),
        SearchBar(
          controller: ctrl,
          leading: const Icon(Icons.attach_money),
          hintText: "R\$",
          onSubmitted: (value) {
            print(value);
          },
        ),
      ],
    ),
  );
}

FinancialQuestionPT2(String moeda) {
  RxBool value = false.obs;
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      backgroundColor: mainColor,
      onPressed: () {
        Get.dialog(GetItinerary());
      },
      child: const Icon(
        Icons.arrow_forward_sharp,
        color: Colors.white,
      ),
    ),
    appBar: defaultAppBar("Geração de roteiros"),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Mais algumas perguntas",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: mainColor, fontSize: 25),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            "3. Quais categorias de gasto são mais importantes para você? (Marque todas que se aplicam)",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ),
        Column(
          children: [
            OptionTile("Hospedagem: Uma boa noite de sono é essencial!"),
            OptionTile("Alimentação: Degustar iguarias é uma prioridade!"),
            OptionTile("Transporte: Chegar rápido e com conforto te motiva!"),
            OptionTile(
                "Passeios e atividades: Explorar ao máximo o destino te define!"),
          ],
        )
      ],
    ),
  );
}

Widget GetItinerary() {
  var repo = LocationRepository();
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      backgroundColor: mainColor,
      onPressed: () {
        Get.dialog(Placeholder());
      },
      child: const Icon(
        Icons.arrow_forward_sharp,
        color: Colors.white,
      ),
    ),
    appBar: defaultAppBar("Geração de roteiros"),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Aqui estão algumas opções de hotel que se encaixam no seu perfil:",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: mainColor, fontSize: 25),
            ),
          ),
        ),
        const SizedBox(height: 10),
        //  FutureBuilder(future: repo.findHotels("Hotels", [21][32] as List<String>), builder: )
      ],
    ),
  );
}

Obx OptionTile(String str) {
  RxBool selec = false.obs;
  return Obx(
    () => Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          selec.value = !selec.value;
        },
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          selected: selec.value,
          selectedColor: Colors.grey[850],
          selectedTileColor: Colors.grey,
          title: Text(str),
        ),
      ),
    ),
  );
}
