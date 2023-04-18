import 'dart:ui';

import '../../constants.dart';
import '../../screens/individual_medicine_screen.dart';
import '../../screens/medicineNotFound.dart';
import '../../screens/searchMedicineCard.dart';
import '../../screens/shopkeeper/IndividualMedicineShop.dart';
import '../../utilities/datamodel.dart';
import '../../utilities/medicineCall.dart';
import 'package:flutter/material.dart';

class ShopManager extends StatelessWidget {
  Future<Data> fetch(String medicineName) async {
    var result = await MedicineDataFetch.sendMessage(medicineName);
    if (result == "failed to fetch") {
      return sampleData;
    }
    return result;
  }

  String searchQuery = "Amoxicillin";
  ShopManager({Key? key}) : super(key: key);

  @override
  final List<MedicineCard> card = [];

  Widget build(BuildContext context) {
    double relative = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: secondryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          'AWASHYAK',
          style: TextStyle(color: lightColor),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 30.0, bottom: 10),
            child: Text(
              "Manage my stocks",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
              padding:const  EdgeInsets.symmetric(horizontal:  20),
              child: SizedBox(
                height: 60,
                child: TextField(
                  onChanged: (value) => {
                    searchQuery = value,
                  },
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                      onTap: () async {
                        Data res = await fetch(searchQuery);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              if (res.brandName == "null") {
                                return MedicineNotFound();
                              } else {
                                return IndividualMedicineShop(
                                  givenDataSet: res,
                                );
                              }
                            }),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.search_outlined,
                        color: primaryColor,
                      ),
                    ),
                    filled: true,
                    fillColor: secondryColor,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: primaryColor, width: 3.0),
                    ),
                    hintText: "Search for Medicine here",
                    hintStyle: const TextStyle(color: primaryColor),
                  ),
                ),
              ),
            ),
          Flexible(
            child: FutureBuilder(
              future: fetch(
                  " "), // here  we need to add the function which return the all the inventry of the medicines
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IndividualMedicineShop(
                            givenDataSet: snapshot.data,
                          ),
                        ),
                      );
                    },
                    child: MedicineCard(givenDataSet: snapshot.data!),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
