import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_and_budget/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/add_budget_model.dart';
import '../utils/utils.dart';
import 'package:http/http.dart' as http;

class AnalyticsController extends GetxController {
  @override
  void onInit() {
    fetchBudget();
    super.onInit();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  List<AddBudgetModel> budgetList = [];
  List<Map<String, double>> allExpenses = [];
  RxBool isLoading = false.obs;
  var maximumValue;

  var minimumValue;

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
        double totalExpenses = budgetList[i]
            .fixedExpenseMap
            .values
            .where((value) => value != null)
            .fold<double>(0, (a, b) => a + double.parse(b.toString()));
        allExpenses.add({
          budgetList[i].budgetName: totalExpenses,
          //'Total Expenses': totalExpenses,
        });
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


  void makeHighest() {
    isLoading.value = true;

    // Sort allExpenses based on the values
    allExpenses.sort((Map<String, double> a, Map<String, double> b) {
      return b.values.first.compareTo(a.values.first);
    });

    // Extract the top three values
    max3 = allExpenses.length >= 3 ? allExpenses.sublist(0, 3) : allExpenses;

    // Sort max3 if necessary
    max3.sort((Map<String, double> a, Map<String, double> b) {
      return b.values.first.compareTo(a.values.first);
    });

    // Find the maximum value in max3
    maximumValue = max3.isEmpty ? null : max3.last.values.first;

    isLoading.value = false;
    print(max3);
    print('-----');
  }





  void makeLowest() {
    isLoading.value = true;

    // Sort allExpenses based on the values
    allExpenses.sort((Map<String, double> a, Map<String, double> b) {
      return a.values.first.compareTo(b.values.first);
    });

    // Extract the top three values
    min3 = allExpenses.length >= 3 ? allExpenses.sublist(0, 3) : allExpenses;

    // Sort max3 if necessary
    min3.sort((Map<String, double> a, Map<String, double> b) {
      return b.values.first.compareTo(a.values.first);
    });

    // Find the maximum value in max3
    minimumValue = min3.isEmpty ? null : min3.last.values.first;

    isLoading.value = false;
    print(min3);
    print('============');
  }

  Future<String> getChatGPTResponse(String userInput) async {
    final apiKey = chatgptApiKey;
    const endpoint = 'https://api.openai.com/v1/chat/completions';

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: '{"model": "gpt-3.5-turbo", "messages": [{"role": "system", "content": "You are a helpful assistant."}, {"role": "user", "content": "$userInput"}]}',
    );

    print(response.body);
    print('printed response');

    if (response.statusCode == 200) {
      // Parse and extract the response from the API
      // You may want to handle the response based on your application's needs
      final jsonResponse = json.decode(response.body);
      final chatGPTResponse = jsonResponse['choices'][0]['message']['content'];
      return chatGPTResponse;
    } else {
      // Handle error
      throw Exception('Failed to get response from ChatGPT');
    }
  }

}
