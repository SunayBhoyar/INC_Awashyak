import 'package:awashyak_v1/screens/shopkeeper/LineChartWidgetState.dart';

import '../../constants.dart';
import '../../screens/chatGPT.dart';
import '../../screens/individual_medicine_screen.dart';
import '../../screens/medicine_search_page.dart';
import '../../screens/shopkeeper/IndividualMedicineShop.dart';
import '../../screens/shopkeeper/shopManager.dart';
import '../../utilities/datamodel.dart';
import '../../utilities/medicineCall.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../pagecontroller.dart';
import 'homepageShop.dart';
import 'package:flutter/services.dart';

class LineChartWidgetState extends StatefulWidget {
  final List<MonthlySales> salesData;
  const LineChartWidgetState({required this.salesData, super.key});

  @override
  State<LineChartWidgetState> createState() => _LineChartWidgetStateState();
}

class _LineChartWidgetStateState extends State<LineChartWidgetState> {
  final List<String> monthsName = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Create a list of FlSpot objects with custom X-axis values

    return Scaffold(
      backgroundColor: secondryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "AWASHYAK",
          style: TextStyle(
            color: lightColor,
            fontSize: 24,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: const Icon(Icons.perm_identity_rounded),
          )
        ],
        backgroundColor: primaryColor,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: RotatedBox(
              quarterTurns: 3,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.38,
                    width: screenWidth * 1.9,
                    child: LineChart(
                      LineChartData(
                        borderData: FlBorderData(show: true),
                        gridData: FlGridData(show: true),
                        lineBarsData: [
                          LineChartBarData(
                            spots: widget.salesData.map((sales) {
                              return FlSpot(
                                  widget.salesData.indexOf(sales).toDouble(),
                                  sales.amount);
                            }).toList(),
                            isCurved: false,
                            color: indibg,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(show: true),
                          ),
                        ],
                        minX: 0,
                        maxX: 11,
                        minY: 0,
                        maxY: 3500,
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 80,
                                  interval: 1,
                                  getTitlesWidget: (value, meta) {
                                    String text = "";
                                    switch (value.toInt()) {
                                      case 0:
                                        text = "JAN";
                                        break;
                                      case 1:
                                        text = "FEB";
                                        break;
                                      case 2:
                                        text = "MAR";
                                        break;
                                      case 3:
                                        text = "APR";
                                        break;
                                      case 4:
                                        text = "MAY";
                                        break;
                                      case 5:
                                        text = "JUNE";
                                        break;
                                      case 6:
                                        text = "JULY";
                                        break;
                                      case 7:
                                        text = "AUG";
                                        break;
                                      case 8:
                                        text = "SEPT";
                                        break;
                                      case 9:
                                        text = "OCT";
                                        break;
                                      case 10:
                                        text = "NOV";
                                        break;
                                      case 11:
                                        text = "DEC";
                                        break;
                                    }
                                    return RotatedBox(
                                        quarterTurns: 4,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(right: 5.0),
                                          child: Text(
                                            text,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ));
                                  })),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                                reservedSize: 15,
                                interval: 1,
                              )),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                                reservedSize: 20,
                                interval: 1,
                              )),

                        ),
                      ),
                    ),
                  ),
                  Text(
                    "MONTHLY SALES",
                    style: TextStyle(
                        fontSize: 20,
                        color: buttonColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );

  }
  @override
  void dispose() {
    // Allow the system to handle screen orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    super.dispose();
  }
}
