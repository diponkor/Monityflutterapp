import 'dart:convert';

import 'package:finance_and_budget/constants/constants.dart';
import 'package:finance_and_budget/model/plaid_accounts_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/utils.dart';

class AccountController extends GetxController {

  PlaidAccountsModel plaidAccountsModel = PlaidAccountsModel();
  bool isLoading = false;
  String publicToken = '';
  String accessToken = '';
  String linkToken = '';

  Future<void> generatePublicToken() async {
    String endPoint = 'sandbox/public_token/create';
    try {
      isLoading = true;
      Map<String, String> headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "client_id": clientId,
        "secret": sandboxSecret,
        "institution_id": "ins_20",
        "initial_products": ["transactions"],
        "options": {"webhook": "https://www.plaid.com/webhook"}
      };

      final response = await http.post(Uri.parse(plaidBaseUrl + endPoint),
          headers: headers,
          body: jsonEncode(body));

      if (response.isNull) return;
      print(response.body);
      var data = json.decode(response.body);
      publicToken = data['public_token'];
      print(publicToken);
      isLoading = false;
      update(['upadtePlaid']);
    } catch (error) {
      Utils.showSnackBar(error.toString());
    }
  }

  Future<void> generateAccessToken() async {
    String endPoint = 'item/public_token/exchange';
    try {
      isLoading = true;
      Map<String, String> headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "client_id": clientId,
        "secret": sandboxSecret,
        "public_token": publicToken,
      };

      final response = await http.post(Uri.parse(plaidBaseUrl + endPoint),
          headers: headers,
          body: jsonEncode(body));

      if (response.isNull) return;
      print(response.body);
      var data = json.decode(response.body);
      accessToken = data['access_token'];
      print(accessToken);
      isLoading = false;
      update(['upadtePlaid']);
    } catch (error) {
      print(error);
      print('Error of generateAccessToken');
      Utils.showSnackBar(error.toString());
    }
  }

  Future<void> generateLinkToken() async {
    String endPoint = 'link/token/create';
    try {
      isLoading = true;
      Map<String, String> headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "client_id": clientId,
        "secret": sandboxSecret,
        "client_name": "Monity",
        "country_codes": ["US"],
        "language": "en",
        "user": {"client_user_id": "devrajib"},
        "products": ["auth"]
      };
      final response = await http.post(Uri.parse(plaidBaseUrl + endPoint),
          headers: headers,
          body: jsonEncode(body));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        linkToken = data['link_token'];
        print(linkToken);
        isLoading = false;
        update(['updatePlaid']);
      } else {
        // Handle non-successful status codes
        Utils.showSnackBar("Failed to generate Link token: ${response.statusCode}");
      }
    } catch (error) {
      // Handle other errors
      Utils.showSnackBar("Error: $error");
    }
  }


  Future<void> getAllAccount() async {
    String endPoint = 'accounts/get';
    try {
      isLoading = true;
      Map<String, String> headers = {'Content-Type': 'application/json'};

      Map<String, dynamic> body = {
        "client_id": clientId,
        "secret": sandboxSecret,
        "access_token": accessToken
      };
      print(accessToken);
      final response = await http
          .post(Uri.parse(plaidBaseUrl + endPoint),
              headers: headers,
              body: jsonEncode(body) // Encode the body as JSON
              )
          .catchError((e) {
        return Utils.showSnackBar(e);
      });
      if (response.isNull) return;
      plaidAccountsModel = plaidAccountsModelFromJson(response.body);
      isLoading = false;
      update(['updateDetails']);
    } catch (error) {
      print(error);
      print('error of link token');
      Utils.showSnackBar(error.toString());
    }
  }
}
