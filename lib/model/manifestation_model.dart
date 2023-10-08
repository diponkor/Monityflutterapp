
class ManifestationModel {
  final String goalName;
  final String popularGoal;
  final String amount;
  final String date;
  final String bank;

  ManifestationModel(
      this.goalName,
      this.popularGoal,
      this.amount,
      this.date,
      this.bank,
      );

  toJson() {
    return {
      'GoalName': goalName,
      'PopularGoal': popularGoal,
      'Amount': amount,
      'Date': date,
      'Bank': bank,
    };
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
}
