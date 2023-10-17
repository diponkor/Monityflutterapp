import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plaid_flutter/plaid_flutter.dart';

import '../../controller/account_controller.dart';

class PlaidScreen extends StatefulWidget {
  @override
  _PlaidScreenState createState() => _PlaidScreenState();
}

class _PlaidScreenState extends State<PlaidScreen> {

  AccountController accountController = Get.put(AccountController());


  LinkConfiguration? _configuration;
  StreamSubscription<LinkEvent>? _streamEvent;
  StreamSubscription<LinkExit>? _streamExit;
  StreamSubscription<LinkSuccess>? _streamSuccess;
  LinkObject? _successObject;

  @override
  void initState() {
    super.initState();
    _streamEvent = PlaidLink.onEvent.listen(_onEvent);
    _streamExit = PlaidLink.onExit.listen(_onExit);
    _streamSuccess = PlaidLink.onSuccess.listen(_onSuccess);
  }

  @override
  void dispose() {
    _streamEvent?.cancel();
    _streamExit?.cancel();
    _streamSuccess?.cancel();
    super.dispose();
  }

  void _createLegacyTokenConfiguration() {
    setState(() {
      _configuration = LegacyLinkConfiguration(
        clientName: "PersonalFinanceApp",
        publicKey: 'public-sandbox-6fc930b1-c667-418b-a9b4-3bd9c86bc454',
        environment: LinkEnvironment.sandbox,
        products: <LinkProduct>[
          LinkProduct.auth,
        ],
        language: "en",
        countryCodes: ['US'],
        userLegalName: "MonityApp",
        userEmailAddress: "monityapp@gmail.com",
        userPhoneNumber: "+1 (512) 555-1234",
      );
    });
  }

  void _createLinkTokenConfiguration() {
    setState(() {
      _configuration = LinkTokenConfiguration(
        token: "link-sandbox-ff6f67cf-7421-49b7-a3c9-292265844590",
      );
    });
  }

  void _onEvent(LinkEvent event) {
    final name = event.name;
    final metadata = event.metadata.description();
    print("onEvent: $name, metadata: $metadata");
  }

  void _onSuccess(LinkSuccess event) {
    final token = event.publicToken;
    final metadata = event.metadata.description();
    print("onSuccess: $token, metadata: $metadata");
    setState(() => _successObject = event);
  }

  void _onExit(LinkExit event) {
    final metadata = event.metadata.description();
    final error = event.error?.description();
    print("onExit metadata: $metadata, error: $error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  _configuration?.toJson().toString() ?? "",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _createLegacyTokenConfiguration,
              child: const Text("Create Legacy Token Configuration"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _createLinkTokenConfiguration,
              child: const Text("Create Link Token Configuration"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _configuration != null
                  ? () => PlaidLink.open(configuration: _configuration!)
                  : null,
              child: const Text("Open"),
            ),
            Expanded(
              child: Center(
                child: Text(
                  _successObject?.toJson().toString() ?? "",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                accountController.getAllAccount();
              },
              child: const Text("See Account details"),
            ),
          ],
        ),
      ),
    );
  }
}
