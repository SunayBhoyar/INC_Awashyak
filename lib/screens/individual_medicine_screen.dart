import 'package:awashyak_v1/constants.dart';
import 'package:awashyak_v1/screens/medical_stores_card.dart';
import 'package:awashyak_v1/utilities/datamodel.dart';
import 'package:flutter/material.dart';

class IndividualMedicine extends StatelessWidget {
  Data? givenDataSet;
  IndividualMedicine(
      {super.key,
      this.givenDataSet});

  @override
  Widget build(BuildContext context) {
    double relHeight = MediaQuery.of(context).size.height;
    double relWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: relWidth,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/BG.png"),
                fit: BoxFit.fill),),
        child: ListView(
          children: [ Column(
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
                padding: EdgeInsets.only(left: relWidth/10, top: relHeight/35),
                child: Text(
                  givenDataSet?.genericName??
                  'Nutrilite Daily',
                  style: TextStyle(color: lightColor, fontSize: relWidth/13, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: relWidth/10, top: relHeight/40, bottom: relHeight/40),
                child: Text(
                  givenDataSet?.description??
                  'Multivitamin and multimineral medication for the developers. Take two pills daily for better results.',
                  style: TextStyle(color: lightColor, fontSize: relHeight/50),
                ),
              ),
              MedicalStoresCard(),
              MedicalStoresCard(),
              MedicalStoresCard(),
            ],
          ),],

        ),
      ),
    );
  }
}
