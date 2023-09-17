import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String companyName;
  final String userRole;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.companyName,
    required this.userRole,
  });

  toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'Password': password,
      'ConfirmPassword': confirmPassword,
      'CompanyName': companyName,
      'UserRole': userRole,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
      firstName: data?['FirstName'],
      lastName: data?['LastName'],
      email: data?['Email'],
      password: data?['Password'],
      confirmPassword: data?['ConfirmPassword'],
      companyName: data?['CompanyName'],
      userRole: data?['UserRole'],
    );
  }
}
