import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/add_budget_model.dart';
import '../utils/utils.dart';

class AnalyticsController extends GetxController {
  @override
  void onInit() {
    fetchBudget();
    super.onInit();
  }
  FirebaseAuth auth = FirebaseAuth.instance;
  List<AddBudgetModel> budgetList = [];
  List allExpenses = [];
  RxBool isLoading = false.obs;
  var maximumValue ;
  var minimumValue ;

  var max3;
  var min3;

  Future<List<AddBudgetModel>> fetchBudget() async {
    try {
      isLoading.value = true;
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection('User')
          .doc(auth.currentUser?.email)
          .collection('Budgets');

      QuerySnapshot querySnapshot = await collectionReference.get();

      List<AddBudgetModel> addBudgetModel = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return AddBudgetModel(
          doc.id,
          data['BudgetName'],
          data['Date'],
          data['IncomeMap'],
          data['FixedExpenseMap'],
          data['VarExpense'],
          data['SinkingFund'],
          data['ActualIncomeMap'],
          data['ActualFixedExpenseMap'],
          data['ActualVarExpense'],
          data['ActualSinkingFund'],
        );
      }).toList();
      budgetList = [];
      budgetList.addAll(addBudgetModel);
      allExpenses = [];
      for (int i = 0; i < budgetList.length; i++) {
        allExpenses.add(budgetList[i]
            .fixedExpenseMap
            .values
            .where((value) => value != null)
            .fold<double>(0, (a, b) => a + double.parse(b.toString())));
      }
      print(allExpenses);
      update(['updateAnalyticsBudList']);
      isLoading.value = false;
      return addBudgetModel;
    } catch (e) {
      print('Error fetching budget: $e');
      Utils.showSnackBar('Error fetching budget: $e');
      return [];
    }
  }

  void makeHighest(){
    isLoading.value = true;
    allExpenses.sort((a, b) => b.compareTo(a));
     max3 = allExpenses.sublist(0, 3);
     max3.sort();
     maximumValue = max3.last;
     isLoading.value = false;
    print(max3);
  }

  void makeLowest(){
    isLoading.value = true;
    allExpenses.sort((a, b) => a.compareTo(b)); // Sort the list in ascending order
    min3 = allExpenses.sublist(0, 3);
    min3.sort();
    minimumValue = min3.first;
    isLoading.value = false;
    print(min3);
  }

  
}
