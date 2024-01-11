import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradiantColors = [Colors.redAccent, Colors.orangeAccent];

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 80,
        //titlesData: Titles.getTitleData(),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.grey[800], strokeWidth: 1);
          },
        ),
        borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.shade800, width: 2)),
        lineBarsData: [
          LineChartBarData(
              spots: [
                const FlSpot(0, 30),
                const FlSpot(2, 10),
                const FlSpot(4, 50),
                const FlSpot(6, 43),
                const FlSpot(8, 40),
                const FlSpot(9, 30),
                const FlSpot(11, 38),
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
