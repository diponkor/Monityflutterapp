
class AddBudgetModel {
  late String id;
  final String budgetName;
  final String date;
  final Map<String, dynamic> incomeMap;

  final Map<String, dynamic> fixedExpenseMap;

  final Map<String, dynamic> varExpense;

  final Map<String, dynamic> sinkingFund;

  AddBudgetModel(
      this.id,
      this.budgetName,
      this.date,
      this.incomeMap,
      this.fixedExpenseMap,
      this.varExpense,
      this.sinkingFund,
      );

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "BudgetName": budgetName,
      "Date": date,
      "IncomeMap": incomeMap,
      "FixedExpenseMap": fixedExpenseMap,
      "VarExpense": varExpense,
      "SinkingFund": sinkingFund,
    };
  }
}
