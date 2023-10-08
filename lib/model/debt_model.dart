
class DebtModel {
  final String debtName;
  final String popularDebt;
  final String interestRate;
  final String haveDebt;
  final String monthlyPayment;
  final String date;

  DebtModel(
      this.debtName,
      this.popularDebt,
      this.interestRate,
      this.haveDebt,
      this.monthlyPayment,
      this.date,
      );

  toJson() {
    return {
      'DebtName': debtName,
      'PopularDebt': popularDebt,
      'InterestRate': interestRate,
      'MonthlyPayment': monthlyPayment,
      'HaveDebt': haveDebt,
      'Date': date,
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
