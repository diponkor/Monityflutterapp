import 'package:finance_and_budget/controller/analytics_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customFlowChart extends StatelessWidget {
  final List<Color> gradiantColors = [Colors.redAccent, Colors.orangeAccent];

  AnalyticsController analyticsController = Get.find();

  @override
  Widget build(BuildContext context) {

    return LineChart(LineChartData(
      //minX: 0,
      //maxX: 10,
        minY: 0,
        maxY: 1000,
        //titlesData: Titles.getTitleData(),
        borderData: FlBorderData(
            border: Border.all(color: Colors.grey.shade800, width: 2)),
        lineBarsData: [
          LineChartBarData(
              spots:analyticsController.allExpenses.length>=5? [
                FlSpot(1, analyticsController.allExpenses[0]),
                FlSpot(2, analyticsController.allExpenses[1]),
                FlSpot(3, analyticsController.allExpenses[2]),
                FlSpot(4, analyticsController.allExpenses[3]),
                FlSpot(5, analyticsController.allExpenses[4]),
                FlSpot(6, analyticsController.allExpenses[5]),
              ]:[
                FlSpot(0, 0),
                FlSpot(2, 0),
                FlSpot(4, 0),
                FlSpot(6, 0),
                FlSpot(8, 0),
                FlSpot(10, 0),
              ],
              isCurved: true,
              //colors: gradiantColors,
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                //colors: gradiantColors.map((color) => color.withOpacity(.4)).toList()
              ))
        ]));
  }
}
