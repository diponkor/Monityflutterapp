import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_and_budget/model/create_budget_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/add_budget_model.dart';
import '../utils/utils.dart';

class BudgetController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  List<CreateBudgetModel> budgetList = [];
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
  var totalIncomeData = 0;

  void getTotalIncomeData(int index) {
    final incomeMap = addBudgetList[index].incomeMap;

    if (incomeMap != null) {
      totalIncomeData = incomeMap.values
          .where((value) => value != null) // Filter out null values
          .fold(0, (a, b) => a.toInt() + int.parse(b.toString()));
    } else {
      print("incomeMap is null.");
    }
  }

  ///Budget View fixed expense..........
  var totalFixedExpense = 0;

  void getTotalFixedExpenseData(int index) {
    final fixExpMap = addBudgetList[index].fixedExpenseMap;

    if (fixExpMap != null) {
      totalFixedExpense = fixExpMap.values
          .where((value) => value != null) // Filter out null values
          .fold(0, (a, b) => a.toInt() + int.parse(b.toString()));
    } else {
      print("fixExpMap is null.");
    }
  }

  ///Budget View fixed expense..........
  var totalVarExpense = 0;

  void getTotalVarExpenseData(int index) {
    final variExpMap = addBudgetList[index].varExpense;

    if (variExpMap != null) {
      totalVarExpense = variExpMap.values
          .where((value) => value != null) // Filter out null values
          .fold(0, (a, b) => a.toInt() + int.parse(b.toString()));
    } else {
      print("fixExpMap is null.");
    }
  }

  ///Budget View fixed expense..........
  var totalSinkFund = 0;

  void getTotalSinkFundData(int index) {
    final sinkFundMap = addBudgetList[index].sinkingFund;

    if (sinkFundMap != null) {
      totalSinkFund = sinkFundMap.values
          .where((value) => value != null) // Filter out null values
          .fold(0, (a, b) => a.toInt() + int.parse(b.toString()));
    } else {
      print("fixExpMap is null.");
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
    final docRef = userCollection.doc(budgetModel.id);
    await docRef.update(budgetModel.toMap()).catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
    budgetList = [];
    fetchBudget();
    update(['updateBudList']);
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
