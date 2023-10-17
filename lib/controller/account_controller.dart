import 'dart:convert';

import 'package:finance_and_budget/constants/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/utils.dart';

class AccountController extends GetxController {
  String publicToken = '';
  String accessToken = '';
  String linkToken = '';

  Future<void> generatePublicToken() async {
    String endPoint = 'sandbox/public_token/create';
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "client_id": "65206e107f9843001a969172",
        "secret": "f63782cd1387ffeb5b83ef3d9f9166",
        "institution_id": "ins_20",
        "initial_products": ["transactions"],
        "options": {"webhook": "https://www.plaid.com/webhook"}
      };

      final response = await http
          .post(Uri.parse(plaidBaseUrl + endPoint),
              headers: headers,
              body: jsonEncode(body) // Encode the body as JSON
              )
          .catchError((e) {
        return Utils.showSnackBar(e);
      });
      if (response.isNull) return;
      print(response.body);
      var data = json.decode(response.body);
      publicToken = data['public_token'];
      print(publicToken);
    } catch (error) {
      Utils.showSnackBar(error.toString());
    }
  }

  Future<void> generateAccessToken() async {
    String endPoint = 'item/public_token/exchange';
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "client_id": clientId,
        "secret": sandboxSecret,
        "public_token": publicToken,
      };

      final response = await http
          .post(Uri.parse(plaidBaseUrl + endPoint),
              headers: headers,
              body: jsonEncode(body) // Encode the body as JSON
              )
          .catchError((e) {
        return Utils.showSnackBar(e);
      });
      if (response.isNull) return;
      print(response.body);
      var data = json.decode(response.body);
      accessToken = data['access_token'];
      print(accessToken);

      /*Note :
      * Here I store access_token in a String.
      * When I want to use this acess token I got empty.
      * */
    } catch (error) {
      Utils.showSnackBar(error.toString());
    }
  }

  Future<void> generateLinkToken() async {
    String endPoint = 'link/token/create';
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "client_id": clientId,
        "secret": sandboxSecret,
        "client_name": "Text1",
        "country_codes": ["US"],
        "language": "en",
        "user": {"client_user_id": "unique_user_id"},
        "products": ["auth"]
      };

      final response = await http
          .post(Uri.parse(plaidBaseUrl + endPoint),
              headers: headers,
              body: jsonEncode(body) // Encode the body as JSON
              )
          .catchError((e) {
        return Utils.showSnackBar(e);
      });
      if (response.isNull) return;
      print(response.body);
      var data = json.decode(response.body);
      linkToken = data['link_token'];
      print(linkToken);
    } catch (error) {
      Utils.showSnackBar(error.toString());
    }
  }

  Future<void> getAllAccount() async {
    String endPoint = 'accounts/balance/get';
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};

      Map<String, dynamic> body = {
        "client_id": clientId,
        "secret": sandboxSecret,
        "access_token": accessToken
      };
      print(accessToken);
      /*
          Here I want to pass access token in this body , but I got an error , which is..
          "error_message": "access_token must be a non-empty string",
      */
      final response = await http
          .post(Uri.parse(plaidBaseUrl + endPoint),
              headers: headers,
              body: jsonEncode(body) // Encode the body as JSON
              )
          .catchError((e) {
        return Utils.showSnackBar(e);
      });
      if (response.isNull) return;
      print(response.body);
      var data = json.decode(response.body);
      print(data);
    } catch (error) {
      Utils.showSnackBar(error.toString());
    }
  }
}
