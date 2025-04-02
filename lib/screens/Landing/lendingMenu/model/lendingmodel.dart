// To parse this JSON data, do
//
//     final lendingModel = lendingModelFromJson(jsonString);

import 'dart:convert';

LendingModel lendingModelFromJson(String str) => LendingModel.fromJson(json.decode(str));

String lendingModelToJson(LendingModel data) => json.encode(data.toJson());

class LendingModel {
  String? status;
  String? message;
  Data? data;

  LendingModel({
    this.status,
    this.message,
    this.data,
  });

  factory LendingModel.fromJson(Map<String, dynamic> json) => LendingModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<PackageResult>? packageResults;
  Balance? balance;
  LendingContent? lendingContent;

  Data({
    this.packageResults,
    this.balance,
    this.lendingContent,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    packageResults: json["package_results"] == null ? [] : List<PackageResult>.from(json["package_results"]!.map((x) => PackageResult.fromJson(x))),
    balance: json["balance"] == null ? null : Balance.fromJson(json["balance"]),
    lendingContent: json["lending_content"] == null ? null : LendingContent.fromJson(json["lending_content"]),
  );

  Map<String, dynamic> toJson() => {
    "package_results": packageResults == null ? [] : List<dynamic>.from(packageResults!.map((x) => x.toJson())),
    "balance": balance?.toJson(),
    "lending_content": lendingContent?.toJson(),
  };
}

class Balance {
  int? bnbBalance;
  int? bnbToUsdBalance;
  int? usdtBalance;
  int? usdtToUsdBalance;
  int? siteUsdtBalance;
  double? siteTokenBalance;
  int? walletUsdSiteUsdTotal;
  int? walletUsdSiteUsdBnbUsdTotal;

  Balance({
    this.bnbBalance,
    this.bnbToUsdBalance,
    this.usdtBalance,
    this.usdtToUsdBalance,
    this.siteUsdtBalance,
    this.siteTokenBalance,
    this.walletUsdSiteUsdTotal,
    this.walletUsdSiteUsdBnbUsdTotal,
  });

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
    bnbBalance: json["bnb_balance"],
    bnbToUsdBalance: json["bnb_to_usd_balance"],
    usdtBalance: json["usdt_balance"],
    usdtToUsdBalance: json["usdt_to_usd_balance"],
    siteUsdtBalance: json["site_usdt_balance"],
    siteTokenBalance: json["site_token_balance"]?.toDouble(),
    walletUsdSiteUsdTotal: json["wallet_usd_site_usd_total"],
    walletUsdSiteUsdBnbUsdTotal: json["wallet_usd_site_usd_bnb_usd_total"],
  );

  Map<String, dynamic> toJson() => {
    "bnb_balance": bnbBalance,
    "bnb_to_usd_balance": bnbToUsdBalance,
    "usdt_balance": usdtBalance,
    "usdt_to_usd_balance": usdtToUsdBalance,
    "site_usdt_balance": siteUsdtBalance,
    "site_token_balance": siteTokenBalance,
    "wallet_usd_site_usd_total": walletUsdSiteUsdTotal,
    "wallet_usd_site_usd_bnb_usd_total": walletUsdSiteUsdBnbUsdTotal,
  };
}

class LendingContent {
  String? gasFee;
  String? content;

  LendingContent({
    this.gasFee,
    this.content,
  });

  factory LendingContent.fromJson(Map<String, dynamic> json) => LendingContent(
    gasFee: json["gas_fee"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "gas_fee": gasFee,
    "content": content,
  };
}

class PackageResult {
  String? packageName;
  int? id;
  String? minimum;
  String? maximum;
  String? roi;
  String? daysDuration;
  bool? fixedpriceStatus;

  PackageResult({
    this.packageName,
    this.id,
    this.minimum,
    this.maximum,
    this.roi,
    this.daysDuration,
    this.fixedpriceStatus,
  });

  factory PackageResult.fromJson(Map<String, dynamic> json) => PackageResult(
    packageName: json["package_name"],
    id: json["id"],
    minimum: json["minimum"],
    maximum: json["maximum"],
    roi: json["roi"],
    daysDuration: json["days_duration"],
    fixedpriceStatus: json["fixedprice_status"],
  );

  Map<String, dynamic> toJson() => {
    "package_name": packageName,
    "id": id,
    "minimum": minimum,
    "maximum": maximum,
    "roi": roi,
    "days_duration": daysDuration,
    "fixedprice_status": fixedpriceStatus,
  };
}
