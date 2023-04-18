import '../../constants.dart';
import '../../screens/medical_stores_card.dart';
import '../../utilities/datamodel.dart';
import 'package:flutter/material.dart';

class IndividualMedicineShop extends StatelessWidget {
  Data? givenDataSet;
  IndividualMedicineShop({super.key, this.givenDataSet});

  @override
  Widget build(BuildContext context) {
    double relHeight = MediaQuery.of(context).size.height;
    double relWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: relWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/BG.png"), fit: BoxFit.fill),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: relWidth / 30),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: primaryColor,
                      size: relWidth / 10,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: relWidth / 20, top: relHeight / 40),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: relHeight / 4,
                    child: Image.asset(
                      'lib/assets/med.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: relWidth / 10, top: relHeight / 35),
                  child: Text(
                    givenDataSet?.genericName ?? 'Nutrilite Daily',
                    style: TextStyle(
                        color: lightColor,
                        fontSize: relWidth / 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: relWidth / 10,
                      top: relHeight / 40,
                      bottom: relHeight / 80),
                  child: Text(
                    givenDataSet?.description ??
                        'Multivitamin and multimineral medication for the developers. Take two pills daily for better results.',
                    style:
                        TextStyle(color: lightColor, fontSize: relHeight / 50),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: relWidth / 10,
                      top: relHeight / 35,
                      bottom: relHeight / 35),
                  child: Text(
                    "Amount of medicine present- ",
                    style: TextStyle(
                        color: lightColor,
                        fontSize: relWidth / 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: relWidth / 10,
                    ),
                    child: Container(
                      height: relHeight / 15,
                      decoration: const BoxDecoration(
                        color: secondryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: relWidth / 3.5,
                    ),
                    child: Container(
                      height: relHeight / 15,
                      decoration: const BoxDecoration(
                        color: indibg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(
                      left: relWidth / 10,
                      top: relHeight / 35,
                      bottom: relHeight / 35),
                  child: Text(
                    "Cost of medicine - ",
                    style: TextStyle(
                        color: lightColor,
                        fontSize: relWidth / 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: relWidth / 10,
                    ),
                    child: Container(
                      height: relHeight / 15,
                      decoration: const BoxDecoration(
                        color: secondryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: relWidth / 3.5,
                      right: relWidth/10
                    ),
                    child: Container(
                      height: relHeight / 15,
                      decoration: const BoxDecoration(
                        color: indibg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
