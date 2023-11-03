import 'package:cloud_firestore/cloud_firestore.dart';

class CreateBudgetModel {
    late String id;
  final String budgetName;
  final String date;
  final String income;
  final String amount;
  final String fixedName;
  final String fixedExp;
  final String variableName;
  final String variableExp;
  final String sinkingName;
  final String sinkingFunds;

  CreateBudgetModel(
      this.id,
    this.budgetName,
    this.date,
    this.income,
    this.amount,
    this.fixedName,
    this.fixedExp,
    this.variableName,
    this.variableExp,
    this.sinkingName,
    this.sinkingFunds,
  );

  toJson() {
    return {
      'Id': id,
      'BudgetName': budgetName,
      'Date': date,
      'Income': income,
      'Amount': amount,
      'FixedName': fixedName,
      'FixedExpense': fixedExp,
      'VariableName': variableName,
      'VariableExpense': variableExp,
      'SinkingName': sinkingName,
      'SinkingFunds': sinkingFunds,
    };
  }

// factory UserModel.fromSnapshot(
//     DocumentSnapshot<Map<String, dynamic>> document) {
//   final data = document.data();
//   return UserModel(
//     firstName: data?['FirstName'],
//     lastName: data?['LastName'],
//     email: data?['Email'],
//     password: data?['Password'],
//     confirmPassword: data?['ConfirmPassword'],
//     companyName: data?['CompanyName'],
//     userRole: data?['UserRole'],
//   );
// }
}
