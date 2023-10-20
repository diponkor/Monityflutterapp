// To parse this JSON data, do
//
//     final plaidAccountsModel = plaidAccountsModelFromJson(jsonString);

import 'dart:convert';

PlaidAccountsModel plaidAccountsModelFromJson(String str) => PlaidAccountsModel.fromJson(json.decode(str));

String plaidAccountsModelToJson(PlaidAccountsModel data) => json.encode(data.toJson());

class PlaidAccountsModel {
  List<Account>? accounts;
  Item? item;
  String? requestId;

  PlaidAccountsModel({
     this.accounts,
     this.item,
     this.requestId,
  });

  factory PlaidAccountsModel.fromJson(Map<String, dynamic> json) => PlaidAccountsModel(
    accounts: List<Account>.from(json["accounts"].map((x) => Account.fromJson(x))),
    item: Item.fromJson(json["item"]),
    requestId: json["request_id"],
  );

  Map<String, dynamic> toJson() => {
    "accounts": List<dynamic>.from(accounts!.map((x) => x.toJson())),
    "item": item?.toJson(),
    "request_id": requestId,
  };
}

class Account {
  String accountId;
  Balances balances;
  String mask;
  String name;
  String? officialName;
  String subtype;
  String type;

  Account({
    required this.accountId,
    required this.balances,
    required this.mask,
    required this.name,
    required this.officialName,
    required this.subtype,
    required this.type,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    accountId: json["account_id"],
    balances: Balances.fromJson(json["balances"]),
    mask: json["mask"],
    name: json["name"],
    officialName: json["official_name"],
    subtype: json["subtype"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "account_id": accountId,
    "balances": balances.toJson(),
    "mask": mask,
    "name": name,
    "official_name": officialName,
    "subtype": subtype,
    "type": type,
  };
}

class Balances {
  int? available;
  double current;
  String isoCurrencyCode;
  int? limit;
  dynamic unofficialCurrencyCode;

  Balances({
    required this.available,
    required this.current,
    required this.isoCurrencyCode,
    required this.limit,
    required this.unofficialCurrencyCode,
  });

  factory Balances.fromJson(Map<String, dynamic> json) => Balances(
    available: json["available"],
    current: json["current"]?.toDouble(),
    isoCurrencyCode: json["iso_currency_code"],
    limit: json["limit"],
    unofficialCurrencyCode: json["unofficial_currency_code"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "current": current,
    "iso_currency_code": isoCurrencyCode,
    "limit": limit,
    "unofficial_currency_code": unofficialCurrencyCode,
  };
}

class Item {
  List<String> availableProducts;
  List<String> billedProducts;
  dynamic consentExpirationTime;
  dynamic error;
  String institutionId;
  String itemId;
  dynamic optionalProducts;
  List<String> products;
  String updateType;
  String webhook;

  Item({
    required this.availableProducts,
    required this.billedProducts,
    required this.consentExpirationTime,
    required this.error,
    required this.institutionId,
    required this.itemId,
    required this.optionalProducts,
    required this.products,
    required this.updateType,
    required this.webhook,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    availableProducts: List<String>.from(json["available_products"].map((x) => x)),
    billedProducts: List<String>.from(json["billed_products"].map((x) => x)),
    consentExpirationTime: json["consent_expiration_time"],
    error: json["error"],
    institutionId: json["institution_id"],
    itemId: json["item_id"],
    optionalProducts: json["optional_products"],
    products: List<String>.from(json["products"].map((x) => x)),
    updateType: json["update_type"],
    webhook: json["webhook"],
  );

  Map<String, dynamic> toJson() => {
    "available_products": List<dynamic>.from(availableProducts.map((x) => x)),
    "billed_products": List<dynamic>.from(billedProducts.map((x) => x)),
    "consent_expiration_time": consentExpirationTime,
    "error": error,
    "institution_id": institutionId,
    "item_id": itemId,
    "optional_products": optionalProducts,
    "products": List<dynamic>.from(products.map((x) => x)),
    "update_type": updateType,
    "webhook": webhook,
  };
}
