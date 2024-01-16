import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/controller/analytics_controller.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class customFlowChart extends StatelessWidget {
  final List<Color> gradiantColors = [Colors.redAccent, Colors.orangeAccent];

  AnalyticsController analyticsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 600.h,
          child: LineChart(
            LineChartData(
              //minX: 0,
              //maxX: 10,
              minY: 0,
              maxY: 1000,
              borderData: FlBorderData(
                  border: Border.all(color: Colors.grey.shade800, width: 2)),
              lineBarsData: [
                LineChartBarData(
                  spots: analyticsController.allExpenses.length >= 5
                      ? [
                          FlSpot(1,
                              analyticsController.allExpenses[0].values.first),
                          FlSpot(2,
                              analyticsController.allExpenses[1].values.first),
                          FlSpot(3,
                              analyticsController.allExpenses[2].values.first),
                          FlSpot(4,
                              analyticsController.allExpenses[3].values.first),
                          FlSpot(5,
                              analyticsController.allExpenses[4].values.first),
                          FlSpot(6,
                              analyticsController.allExpenses[5].values.first),
                        ]
                      : [
                          const FlSpot(0, 0),
                          const FlSpot(2, 0),
                          const FlSpot(4, 0),
                          const FlSpot(6, 0),
                          const FlSpot(8, 0),
                          const FlSpot(10, 0),
                        ],
                  isCurved: true,
                  barWidth: 3,
                  belowBarData: BarAreaData(
                    show: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < analyticsController.allExpenses.length; i++)
              SizedBox(
                width: 50.w,
                child: Center(
                    child: subTitleText(
                        analyticsController.allExpenses[i].keys.first,
                        color: black,
                        size: 14)),
              ),
          ],
        )
      ],
    );
  }
}
