class DebtModel {
  final String debtName;
  final String amount;
  final String interestRate;
  final String required;

  DebtModel(
    this.debtName,
    this.amount,
    this.interestRate,
    this.required,
  );

  toJson() {
    return {
      'DebtName': debtName,
      'Amount': amount,
      'InterestRate': interestRate,
      'Required': required,
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
