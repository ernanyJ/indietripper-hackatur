import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Optile extends StatelessWidget {
  String str = "";
  RxBool selec = false.obs;
  Optile({super.key, required this.str});

  @override
  Widget build(BuildContext context) {
    Container(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              selec.value = !selec.value;
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              selected: selec.value,
              selectedColor: Colors.grey[850],
              selectedTileColor: Colors.grey,
              title: Text(str),
            ),
          ),
        ),
      ),
    );
    return Container();
  }
}
