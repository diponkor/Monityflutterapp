import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_and_budget/model/debt_model.dart';
import 'package:finance_and_budget/model/manifestation_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class ManifestationController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    fetchManifestation();
    //fetchDebt();
    super.onInit();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  List<ManifestationModel> manifestationList = [];
  List<DebtModel> debtList = [];

  List<TextEditingController> milestoneControllers = [];

   List<bool> checkboxValues = List.generate(5, (index) => false);

  void toggleCheckbox(int index) {
    checkboxValues[index] = !checkboxValues[index];
    update(['checkUpdate']);
  }

  List<Map<String, dynamic>> mileTextList = [];

  void makeMileList() {
    for (var x in milestoneControllers) {
      mileTextList.add({'mile': x.text, "isChecked": false});
    }
  }

  void makeMileListCheck() {
    for (var x=0;x< milestoneControllers.length;x++) {
      mileTextList.add({'mile': milestoneControllers[x].text, "isChecked": checkboxValues[x]});
    }
  }



  Future<void> createManifestation(ManifestationModel manifestationModel) async {
    Utils.showLoading();
    try {
      final manifesCollection = FirebaseFirestore.instance
          .collection('User')
          .doc(auth.currentUser?.email)
          .collection('Manifestation');
      final uid = manifesCollection.doc().id;
      final docRef = manifesCollection.doc(uid);
      manifestationModel.id = uid;
      await docRef.set(manifestationModel.toJson());
      manifestationList = [];
      await fetchManifestation();
      update(['updateManifestationList']);
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
      Utils.showSnackBar('Error creating manifestation: $e');
    } finally {
      Utils.hidePopup();
    }
  }



  Future<void> updateManifestation(ManifestationModel manifestationModel) async {
    Utils.showLoading();
    final manifesCollection = FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser?.email)
        .collection('Manifestation');
    final docRef = manifesCollection.doc(manifestationModel.id);

    print(docRef);
    await docRef.update(manifestationModel.toJson()).catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
    manifestationList = [];
    fetchManifestation();
    update(['updateManifestationList']);
    Utils.hidePopup();
  }

  Future<void> deleteManifes(int index) async {
    final manifesCollection = FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser?.email)
        .collection('Manifestation');
    ManifestationModel manifesModel = manifestationList[index];
    final docRef = manifesCollection.doc(manifesModel.id);
    await docRef.delete().catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
    manifestationList = [];
    fetchManifestation();
    update(['updateManifestationList']);
  }

  Future<List<ManifestationModel>> fetchManifestation() async {
    try {
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection('User')
          .doc(auth.currentUser?.email)
          .collection('Manifestation');

      QuerySnapshot querySnapshot = await collectionReference.get();
      manifestationList = [];

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        List<Map<String, dynamic>> mileStones = (data['MileStones'] as List<dynamic>)
            .map((milestone) => Map<String, dynamic>.from(milestone))
            .toList();

        ManifestationModel maniModel = ManifestationModel(
          data['Id'],
          data['GoalName'],
          data['Amount'],
          data['ByWhen'],
          mileStones,
        );
        manifestationList.add(maniModel);
      }
      update(['updateManifestationList']);
      return manifestationList;
    } catch (e) {
      Utils.showSnackBar(e.toString());
      return [];
    }
  }


  Future<void> createDebt(DebtModel debtModel) async {
    Utils.showLoading();
    await _db
        .collection('User')
        .doc(auth.currentUser?.email)
        .collection('Debt')
        .doc()
        .set(debtModel.toJson())
        .catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
    debtList = [];
    fetchDebt();
    update(['updateDebtList']);
    Utils.hidePopup();
  }

  Future<List<DebtModel>> fetchDebt() async {
    try {
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection('User')
          .doc(auth.currentUser?.email)
          .collection('Debt');

      QuerySnapshot querySnapshot = await collectionReference.get();
      debtList = [];

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        DebtModel newDebtModel = DebtModel(
          data['DebtName'],
          data['Amount'],
          data['InterestRate'],
          data['Required'],
        );
        debtList.add(newDebtModel);
      }
      update(['updateDebtList']);
      return debtList;
    } catch (e) {
      print(e);
      Utils.showSnackBar(e.toString());
      return [];
    }
  }
}
