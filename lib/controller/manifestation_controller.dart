import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_and_budget/model/debt_model.dart';
import 'package:finance_and_budget/model/manifestation_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

class ManifestationController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    fetchManifestation();
    fetchDebt();
    print(manifestationList.length);

    print(manifestationList.length);
    super.onInit();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  List<ManifestationModel> manifestationList = [];
  List<DebtModel> debtList = [];

  Future<void> createManifestation(
      ManifestationModel manifestationModel) async {
    Utils.showLoading();
    await _db
        .collection('User')
        .doc(auth.currentUser?.email)
        .collection('Manifestation')
        .doc()
        .set(manifestationModel.toJson())
        .catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
    manifestationList = [];
    fetchManifestation();
    update(['updateManifestationList']);
    Utils.hidePopup();
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
        ManifestationModel maniModel = ManifestationModel(data['GoalName'],
            data['PopularGoal'], data['Amount'], data['Date'], data['Bank']);
        manifestationList.add(maniModel);
      }
      update(['updateManifestationList']);
      return manifestationList;
    } catch (e) {
      print(e);
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
