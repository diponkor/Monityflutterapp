import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_and_budget/model/user_model.dart';
import 'package:finance_and_budget/utils/utils.dart';
import 'package:finance_and_budget/view/custom_navigation_bar.dart';
import 'package:finance_and_budget/view/web_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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

  Future<bool> signIn(String email, String password) async {
    //isLoading.value = true;
    Utils.showLoading();
    validateLogIn(email, password);
    if (!isPasswordValid) {
      Utils.hidePopup();
      Utils.showSnackBar('Password length is too short');
      return false;
    }
    bool success = false;
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Utils.showSnackBar('You\'re logged in successfully');
      Utils.hidePopup();
      success = true;
    }).catchError((e) {
      print(e.code);
      Utils.hidePopup();
      Utils.showSnackBar(e.code);

    });
    //isLoading.value = false;
    return success;
  }

  Future<bool> isEmailAlreadyUsed(String email) async {
    try {
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      // If signInMethods is not empty, that means the email is already in use.
      return signInMethods.isNotEmpty;
    } catch (e) {
      print("Error checking email registration: $e");
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    //isLoading.value = true;
    if (await isEmailAlreadyUsed(email)) {
      print("Email is already registered");
      Utils.showSnackBar('Email is already registered');
      return false;
    } else {
      Utils.showLoading();
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        Utils.hidePopup();
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        //isLoading.value = false;
      }).catchError((e) {
        print(e.code);
        Utils.showSnackBar(e.code);
      });
      Utils.hidePopup();
      return true;
    }
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

  void sendEmailLink(String email) async {
    try {
      // Call the sendSignInLinkToEmail method on the FirebaseAuth instance
      await auth.currentUser?.sendEmailVerification();
      Utils.showSnackBar('Verification email sent to $email');
    } catch (e) {
      Utils.showSnackBar('Failed to send verification email: $e');
      print(e);
    }
  }
}
