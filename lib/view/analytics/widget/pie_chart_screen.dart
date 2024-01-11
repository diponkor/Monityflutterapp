import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../controller/analytics_controller.dart';
import '../../../controller/budget_controller.dart';

class PieChartScreen extends StatefulWidget {
  final int index;
  final bool isActual;

  const PieChartScreen(this.index, this.isActual, {Key? key}) : super(key: key);

  @override
  State<PieChartScreen> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  AnalyticsController analyticsController = Get.put(AnalyticsController());
  final BudgetController budgetController = Get.find();

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Income": budgetController.addBudgetList[widget.index].incomeMap.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString())),
      "Fixed Expense": budgetController
          .addBudgetList[widget.index].fixedExpenseMap.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString())),
      "Variable Expense": budgetController
          .addBudgetList[widget.index].varExpense.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString())),
      "Sinking Funds": budgetController
          .addBudgetList[widget.index].sinkingFund.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString())),
      //"Other": 2.83,
    };
    Map<String, double> dataMapActual = {
      "Income": budgetController
          .addBudgetList[widget.index].actualIncomeMap.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString())),
      "Fixed Expense": budgetController
          .addBudgetList[widget.index].actualFixedExpenseMap.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString())),
      "Variable Expense": budgetController
          .addBudgetList[widget.index].actualVarExpense.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString())),
      "Sinking Funds": budgetController
          .addBudgetList[widget.index].actualSinkingFund.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString())),
      //"Other": 2.83,
    };

    List<Color> colorList = [
      const Color(0xff3EE060),
      const Color(0xff3398F6),
      const Color(0xffFA4A42),
      const Color(0xffFE9539),
      // const Color(0xffD95AF3),
    ];

    return Center(
      child: PieChart(
        dataMap: widget.isActual ? dataMapActual : dataMap,
        chartType: ChartType.ring,
        colorList: colorList,
        chartRadius: MediaQuery.of(context).size.width / 2,
        centerText: "Budget",
        ringStrokeWidth: 24,
        animationDuration: const Duration(seconds: 3),
        chartValuesOptions: const ChartValuesOptions(
            showChartValues: true,
            showChartValuesOutside: true,
            showChartValuesInPercentage: true,
            showChartValueBackground: false),
        legendOptions: const LegendOptions(
            showLegends: true,
            legendShape: BoxShape.rectangle,
            legendTextStyle: TextStyle(fontSize: 15),
            legendPosition: LegendPosition.bottom,
            showLegendsInRow: true),
        //gradientList: gradientList,
      ),
    );
  }
}
