import '../constants.dart';
import '../utilities/datamodel.dart';
import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({Key? key, required this.givenDataSet}) : super(key: key);
  

  final Data givenDataSet;
  @override
  Widget build(BuildContext context) {
    double relative = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: relative / 80, horizontal: relative / 40),
      child: Container(
        height: relative / 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: kPrimaryColor, width: 2),
            color: primaryColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      givenDataSet.brandName??"Name not fetched",
                      style: TextStyle(
                        color: secondryColor,
                        fontSize: relative / 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: relative / 100),
                    Text(
                      givenDataSet.description??"No details available",
                      style: TextStyle(
                        fontSize: relative / 60,
                        color: secondryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: kPrimaryColor, width: 2),
                    color: primaryColor),
                height: relative / 5,
                width: double.infinity,
                child: Image.asset(
                  'lib/assets/med.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
