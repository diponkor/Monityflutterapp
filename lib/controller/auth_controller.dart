import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_and_budget/model/user_model.dart';
import 'package:finance_and_budget/utils/utils.dart';
import 'package:finance_and_budget/view/custom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool passHide = true.obs;
  bool isEmailOrPhoneValid = true;
  bool isPasswordValid = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;


  void passValueChange() {
    if (passHide.isTrue) {
      passHide.value = false;
    } else {
      passHide.value = true;
    }
    print(passHide.value);
    update(['passUpdate']);
  }

  validateLogIn(String email, String pass) {
    isEmailOrPhoneValid = Utils.isEmailValid(email);
    isPasswordValid = Utils.isPasswordValid(pass);
  }

  Future<void> signIn(String email, String password) async {
    //isLoading.value = true;
    validateLogIn(email, password);
    Utils.showLoading();
    if (!isPasswordValid) {
      Utils.showSnackBar('Password lenth is too short');
    }
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.offAll(const CustomNavigation());
      Utils.showSnackBar('You\'re logged in successfully');
      Utils.hidePopup();
    }).catchError((e) {
      print(e.code);
      Utils.showSnackBar(e.code);
    });
    //isLoading.value = false;
  }

  Future<void> signUp(String email, String password) async {
    //isLoading.value = true;
    Utils.showLoading();
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.offAll(const CustomNavigation());
      Utils.hidePopup();
      //isLoading.value = false;
    }).catchError((e) {
      print(e.code);
      Utils.showSnackBar(e.code);
    });
    Utils.hidePopup();
  }

  Future<void> createUser(UserModel userModel) async {
    await _db
        .collection('User')
        .doc(auth.currentUser?.email)
        .set(userModel.toJson())
        .catchError((e) {
      print(e);
      Utils.showSnackBar(e.code);
    });
  }

  Future<void> sendPasswordResetOTP(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }


}
