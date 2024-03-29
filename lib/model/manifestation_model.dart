class ManifestationModel {
  late String id;
  final String goalName;
  final String amount;
  final String byWhen;
  final List<Map<String, dynamic>> mileStones;

  ManifestationModel(
    this.id,
    this.goalName,
    this.amount,
    this.byWhen,
    this.mileStones,
  );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'GoalName': goalName,
      'Amount': amount,
      'ByWhen': byWhen,
      'MileStones': mileStones,
    };
  }
}

// factory UserModel.fromSnapshot(
//     DocumentSnapshot<Map<String, dynamic>> document) {
//   final data = document.data();
//   return UserModel(
//     firstName: data?['FirstName'],
//     lastName: data?['LastName'],
//     email: data?['Email'],
//     password: data?['Password'],
//     confirmPassword: data?['ConfirmPassword'],
//     companyName: data?['CompanyName'],
//     userRole: data?['UserRole'],
//   );
// }
