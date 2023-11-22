import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/add_budget_model.dart';
import '../utils/utils.dart';

class BudgetController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  List<AddBudgetModel> addBudgetList = [];



  //income......
  List<TextEditingController> incomeControllers = [];
  List<TextEditingController> amountControllers = [];
  Map<String, String> incomeAmountMap = {};

  void makeIncomeMap() {
    for (int i = 0; i < incomeControllers.length; i++) {
      incomeAmountMap[incomeControllers[i].text] = amountControllers[i].text;
    }
  }

  //fixed exp......
  List<TextEditingController> fixedNameControllers = [];
  List<TextEditingController> fixedExpControllers = [];
  Map<String, String> fixedExpMap = {};

  void makeFixedExpMap() {
    for (int i = 0; i < fixedNameControllers.length; i++) {
      fixedExpMap[fixedNameControllers[i].text] = fixedExpControllers[i].text;
    }
  }

  //var exp......
  List<TextEditingController> varNameControllers = [];
  List<TextEditingController> varExpControllers = [];
  Map<String, String> varExpMap = {};

  void makeVarExpMap() {
    for (int i = 0; i < varNameControllers.length; i++) {
      varExpMap[varNameControllers[i].text] = varExpControllers[i].text;
    }
  }

  //sink fund......
  List<TextEditingController> sinkNameControllers = [];
  List<TextEditingController> sinkFundControllers = [];
  Map<String, String> sinkFundMap = {};

  void makeSinkFundMap() {
    for (int i = 0; i < sinkNameControllers.length; i++) {
      sinkFundMap[sinkNameControllers[i].text] = sinkFundControllers[i].text;
    }
  }

  ///Budget View Income..........
  double totalIncomeData = 0;

  void getTotalIncomeData(int index) {
    final incomeMap = addBudgetList[index].incomeMap;

    if (incomeMap != null) {
      // totalIncomeData = incomeMap.values
      //     .where((value) => value != null)
      //     .fold(0, (a, b) => a.toInt() + int.parse(b.toString()));


      totalIncomeData = incomeMap.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString()));

    } else {
      print("incomeMap is null.");
    }
  }

  ///Budget View fixed expense..........
  double totalFixedExpense = 0;

  void getTotalFixedExpenseData(int index) {
    final fixExpMap = addBudgetList[index].fixedExpenseMap;

    if (fixExpMap != null) {
      // totalFixedExpense = fixExpMap.values
      //     .where((value) => value != null) // Filter out null values
      //     .fold(0, (a, b) => a.toInt() + int.parse(b.toString()));

      totalFixedExpense = fixExpMap.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString()));
    } else {
      print("fixExpMap is null.");
    }
  }

  ///Budget View fixed expense..........
  double totalVarExpense = 0;

  void getTotalVarExpenseData(int index) {
    final variExpMap = addBudgetList[index].varExpense;

    if (variExpMap != null) {
      // totalVarExpense = variExpMap.values
      //     .where((value) => value != null) // Filter out null values
      //     .fold(0, (a, b) => a.toInt() + int.parse(b.toString()));
      totalVarExpense = variExpMap.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString()));
    } else {
      print("fixExpMap is null.");
    }
  }

  ///Budget View fixed expense..........
  double totalSinkFund = 0;

  void getTotalSinkFundData(int index) {
    final sinkFundMap = addBudgetList[index].sinkingFund;

    if (sinkFundMap != null) {
      // totalSinkFund = sinkFundMap.values
      //     .where((value) => value != null) // Filter out null values
      //     .fold(0, (a, b) => a.toInt() + int.parse(b.toString()));
      totalSinkFund = sinkFundMap.values
          .where((value) => value != null)
          .fold<double>(0, (a, b) => a + double.parse(b.toString()));
    } else {
      print("fixExpMap is null.");
    }
  }


  ///Actual data controllers.........................
  ///
  //income
  Map<String, TextEditingController> actualIncomeControllerMap = {};
  double totalActualIncome = 0;
  Map<String, String> actualIncomeMapData = {};

  void getTotalActualIncome() {
    actualIncomeControllerMap.forEach((key, value) {
      try {
        double val = double.parse(value.text);
        totalActualIncome += val;
      } catch (e) {
        print(e);
      }
    });
  }

  Map<String, String> newActualIncomeMap = {};
 void makeNewActualIncomeMap(){
   actualIncomeControllerMap.forEach((key, controller) {
     newActualIncomeMap[key] = controller.text;
   });
   // print(actualIncomeControllerMap.length);
   // print(newActualIncomeMap);
 }

  Map<String, String> newActualFixMap = {};
  void makeNewActualFixMap(){
    actualFixedControllerMap.forEach((key, controller) {
      newActualFixMap[key] = controller.text;
    });
  }

  Map<String, String> newActualVarMap = {};
  void makeNewActualVarMap(){
    actualVarControllerMap.forEach((key, controller) {
      newActualVarMap[key] = controller.text;
    });
  }

  Map<String, String> newActualSingMap = {};
  void makeNewActualSinkMap(){
    actualSinkControllerMap.forEach((key, controller) {
      newActualSingMap[key] = controller.text;
    });
  }

  //fixedExp
  Map<String, TextEditingController> actualFixedControllerMap = {};
  double totalActualFixed = 0;

  void getTotalActualFixed() {
    actualFixedControllerMap.forEach((key, value) {
      try {
        double val = double.parse(value.text);
        totalActualFixed += val;
      } catch (e) {
        print(e);
      }
    });
  }
  //varExp
  Map<String, TextEditingController> actualVarControllerMap = {};
  double totalActualVar = 0;

  void getTotalActualVar() {
    actualVarControllerMap.forEach((key, value) {
      try {
        double val = double.parse(value.text);
        totalActualVar += val;
      } catch (e) {
        print(e);
      }
    });
  }
  //sinkFund
  Map<String, TextEditingController> actualSinkControllerMap = {};
  double totalActualSink = 0;

  void getTotalActualSink() {
    actualSinkControllerMap.forEach((key, value) {
      try {
        double val = double.parse(value.text);
        totalActualSink += val;
      } catch (e) {
        print(e);
      }
    });
  }


  ///compare function for plannedIncome to actualIncome
  String compareIncomeText = '';
  void getCompareIncome() {
    if(totalIncomeData>totalActualIncome){
      compareIncomeText = 'You are doing fine';
    }else{
      compareIncomeText = 'You have to save money';
    }
  }

  ///compare function for plannedFixed to actualFixed
  String compareFixedText = '';
  void getCompareFixed() {
    if(totalFixedExpense>totalActualFixed){
      compareFixedText = 'You are doing fine';
    }else{
      compareFixedText = 'You have to save money';
    }
  }
  ///compare function for plannedFixed to actualFixed
  String compareVarText = '';
  void getCompareVar() {
    if(totalVarExpense>totalActualVar){
      compareVarText = 'You are doing fine';
    }else{
      compareVarText = 'You have to save money';
    }
  }
  ///compare function for plannedFixed to actualFixed
  String compareSinkText = '';
  void getCompareSink() {
    if(totalSinkFund>totalActualSink){
      compareSinkText = 'You are doing fine';
    }else{
      compareSinkText = 'You have to save money';
    }
  }


  String top3ExpThisYear = 'Your top 3 expense are : \$500, \$300, \$100';
  String makeLastWeek = 'You make\$1500 in last week';
  String spendLastMonth = 'You spent \$2000 in last week';

  Future<void> createBudget(AddBudgetModel budgetModel) async {
    final userCollection = FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser?.email)
        .collection('Budgets');
    final uid = userCollection.doc().id;
    final docRef = userCollection.doc(uid);
    budgetModel.id = uid;
    await docRef.set(budgetModel.toMap()).catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
    addBudgetList = [];
    fetchBudget();
    update(['updateBudList']);
  }

  Future<void> updateBudget(AddBudgetModel budgetModel) async {
    final userCollection = FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser?.email)
        .collection('Budgets');
    print(budgetModel.actualIncomeMap);
    final docRef = userCollection.doc(budgetModel.id);
    await docRef.update(budgetModel.toMap()).catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
    addBudgetList = [];
    fetchBudget();
    Utils.showSnackBar('Updated');
  }

  Future<void> deleteBudget(int index) async {
    final userCollection = FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser?.email)
        .collection('Budgets');
    AddBudgetModel budgetModel = addBudgetList[index];
    final docRef = userCollection.doc(budgetModel.id);
    await docRef.delete().catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
    addBudgetList = [];
    fetchBudget();
    update(['updateBudList']);
  }

  Future<List<AddBudgetModel>> fetchBudget() async {
    try {
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
      addBudgetList = [];
      addBudgetList.addAll(addBudgetModel);
      update(['updateBudList']);
      return addBudgetModel;
    } catch (e) {
      print('Error fetching budget: $e');
      Utils.showSnackBar('Error fetching budget: $e');
      return [];
    }
  }
}
