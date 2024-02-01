import 'package:finance_and_budget/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/analytics_controller.dart';

class BarChartSample2 extends StatefulWidget {
  BarChartSample2({super.key});

  final Color leftBarColor = Colors.blue;
  final Color rightBarColor = Colors.blueGrey;
  final Color avgColor = primaryColor;

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  AnalyticsController analyticsController = Get.find();
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;
  List<String> titles = [];
  final staticTitles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

  @override
  void initState() {

    super.initState();
    final barGroup1 = makeGroupData(0, analyticsController.allExpenses[0].values.first, 120);
    final barGroup2 = makeGroupData(1, analyticsController.allExpenses[1].values.first, 200);
    final barGroup3 = makeGroupData(2, analyticsController.allExpenses[2].values.first, 500);
    final barGroup4 = makeGroupData(3, analyticsController.allExpenses[3].values.first, 350);
    final barGroup5 = makeGroupData(4, analyticsController.allExpenses[4].values.first, 600);
    final barGroup6 = makeGroupData(5, analyticsController.allExpenses[5].values.first, 500);
    //final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      //barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;

    for (int i = 0; i < 6; i++) {
      titles.add(analyticsController.allExpenses[i].keys.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 40.h),
            SizedBox(
              height: 500.h,
              child: BarChart(
                BarChartData(
                  maxY: 1000,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (a, b, c, d) {
                        return BarTooltipItem(
                          'Data',
                          const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 18,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 12,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 100) {
      text = '100';
    } else if (value == 200) {
      text = '200';
    } else if (value == 300) {
      text = '300';
    } else if (value == 400) {
      text = '400';
    } else if (value == 500) {
      text = '500';
    } else if (value == 600) {
      text = '600';
    } else if (value == 700) {
      text = '700';
    } else if (value == 800) {
      text = '800';
    } else if (value == 900) {
      text = '900';
    } else if (value == 1000) {
      text = '1k';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final Widget text = Text(
      analyticsController.allExpenses.length > 6
          ? staticTitles[value.toInt()]
          : titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }

}
