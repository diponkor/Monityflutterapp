import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_and_budget/model/create_budget_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class BudgetController extends GetxController {


  FirebaseAuth auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  List<CreateBudgetModel> budgetList = [];


  String top3ExpThisYear = 'Your top 3 expense are : \$500, \$300, \$100';
  String makeLastWeek = 'You make\$1500 in last week';
  String spendLastMonth = 'You spent \$2000 in last week';

  // List<double> topTwoAmounts = budgetList
  //     .map((budget) => double.parse(budget.amount))
  //     .toList()
  //   ..sort((a, b) => b.compareTo(a))
  //   ..take(2);

  Future<void> createBudget(CreateBudgetModel budgetModel) async {
    await _db
        .collection('User')
        .doc(auth.currentUser?.email)
        .collection('Budgets')
        .doc()
        .set(budgetModel.toJson())
        .catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
    budgetList = [];
    fetchBudget();
    update(['updateBudList']);
  }


  Future<List<CreateBudgetModel>> fetchBudget() async {
    try {
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection('User')
          .doc(auth.currentUser?.email)
          .collection('Budgets');

      QuerySnapshot querySnapshot = await collectionReference.get();
       budgetList = [];

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        CreateBudgetModel budgetModel = CreateBudgetModel(
          data['BudgetName'],
          data['Date'],
          data['Income'],
          data['Amount'],
          data['FixedName'],
          data['FixedExpense'],
          data['VariableName'],
          data['VariableExpense'],
          data['SinkingName'],
          data['SinkingFunds'],
        );
        budgetList.add(budgetModel);
      }
      update(['updateBudList']);
      return budgetList;
    } catch (e) {
      print(e);
      Utils.showSnackBar(e.toString());
      return [];
    }
  }

}
