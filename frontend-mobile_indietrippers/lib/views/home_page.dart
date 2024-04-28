import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import 'where_you_go.dart';

homePage(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(30.0)),
              width: 45,
              height: 45,
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Text(
                        'Saldo',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.add,
                        size: 20,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Text(
                        "R\$ 1.000,00",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.remove_red_eye_outlined,
                        weight: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20.0, left: 15.0, bottom: 8.0),
        child: Text(
          'Bem vindo, viajante!',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: GestureDetector(
          onTap: () {
            Get.to(whereYouGo(context));
          },
          child: Container(
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.sizeOf(context).width,
            height: 90,
            child: const Row(
              children: [
                SizedBox(width: 15),
                Icon(
                  Icons.explore,
                  color: Colors.white,
                  size: 60,
                ),
                SizedBox(width: 15),
                Text(
                  'Criar novo roteiro',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 17),
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          categoriesOption(75, Icons.groups, "Comunidade"),
          categoriesOption(75, Icons.auto_awesome, "Eventos"),
          categoriesOption(75, Icons.history, "Histórico"),
          categoriesOption(75, Icons.attach_money, "Finanças"),
          const SizedBox(width: 4),
        ],
      )
    ],
  );
}

Widget categoriesOption(double size, IconData data, String title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 9.0),
        child: Container(
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(50),
          ),
          width: size,
          height: size,
          child: Icon(
            data,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w400),
      )
    ],
  );
}
