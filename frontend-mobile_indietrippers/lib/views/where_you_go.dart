import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:indietripper_v2/widgets/default_app_bar.dart';

import '../controllers/PlaceController.dart';
import '../models/Place.dart';
import 'travellers_profile.dart';

Widget whereYouGo(BuildContext context) {
  TextEditingController controller = TextEditingController();
  var str = "".obs;

  return Scaffold(
    appBar: defaultAppBar("Geração de roteiro"),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchBar(
            controller: controller,
            leading: const Icon(Icons.search),
            hintText: "Gramado, RS",
            onSubmitted: (value) {
              str.value = controller.text;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(
            () => FutureBuilder(
              future: getPlace(str.value),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Place>> snapshot) {
                if (snapshot.hasData && str.value != "") {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            var b = await getLatLong(
                                snapshot.data![index].locationId!);
                            // ignore: use_build_context_synchronously
                            Get.dialog(TravellersProfile(b));
                          },
                          child: geoCard(context, snapshot.data![index].name!,
                              snapshot.data![index].addressString!),
                        );
                      },
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
          )
        ],
      ),
    ),
  );
}

Widget geoCard(BuildContext context, String name, String address) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(name),
            Expanded(child: Text(address)),
          ],
        ),
      ),
    ),
  );
}
