import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/user_model.dart';
import '../utils/utils.dart';
import '../view/authentication/signin_screen.dart';

class ProfileController extends GetxController {
  var imagePath = '';
  final ImagePicker picker = ImagePicker();
  FirebaseAuth auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  final _db = FirebaseFirestore.instance;
  UserModel? userData;

  ///image picker code for profile picture ...........

  void pickedImage(ImageSource imgCam) async {
    final XFile? image = await picker.pickImage(source: imgCam);
    imagePath = image!.path;
    update(['imgPathUpdate']);
  }

  Future<void> signOut() async {
    await auth.signOut().then((value) {
      Get.offAll(const SigninScreen());
    });
  }

  Future<UserModel?> getUserDetails() async {
    try {
      final snapshot = await _db
          .collection('User')
          .where('Email', isEqualTo: auth.currentUser?.email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
        update(['profileUpdate']);
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user details: $e');
      return null;
    }
  }

  Future<void> updateProfileData(
      String firstName, String lastName, /*String email*/) async {
    final document = await _db.collection('User').doc(currentUser?.email);
    document.update({
      'FirstName': firstName,
      'LastName': lastName,
      //'Email': email,
    }).then((value) {
      Utils.showSnackBar('Updated');
    }).catchError((e){
      print(e);
      Utils.showSnackBar(e.code);
    });
  }

  Future<void> changePassword({email, oldPassword, newPassword}) async {
    var cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);
    await auth.currentUser?.reauthenticateWithCredential(cred).then((value) {
      auth.currentUser?.updatePassword(newPassword);
      Utils.showSnackBar('Password Changed');
    }).catchError((e) {
      Utils.showSnackBar(e.code);
    });
  }
}
