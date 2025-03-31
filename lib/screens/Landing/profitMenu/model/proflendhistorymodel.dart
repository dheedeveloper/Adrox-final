
// To parse this JSON data, do
//
//     final profitLendHistoryModel = profitLendHistoryModelFromJson(jsonString);

import 'dart:convert';

ProfitLendHistoryModel profitLendHistoryModelFromJson(String str) => ProfitLendHistoryModel.fromJson(json.decode(str));

String profitLendHistoryModelToJson(ProfitLendHistoryModel data) => json.encode(data.toJson());

class ProfitLendHistoryModel {
  String? status;
  String? message;
  Data? data;

  ProfitLendHistoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProfitLendHistoryModel.fromJson(Map<String, dynamic> json) => ProfitLendHistoryModel(
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
  Lending? lending;
  List<History>? history;

  Data({
    this.lending,
    this.history,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    lending: json["Lending"] == null ? null : Lending.fromJson(json["Lending"]),
    history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Lending": lending?.toJson(),
    "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
  };
}

class History {
  String? amount;
  String? name;
  String? hashId;
  DateTime? createdDate;
  DateTime? endDate;
  int? daysDuration;
  String? profit;
  bool? status;

  History({
    this.amount,
    this.name,
    this.hashId,
    this.createdDate,
    this.endDate,
    this.daysDuration,
    this.profit,
    this.status,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    amount: json["amount"],
    name: json["name"],
    hashId: json["hash_id"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    daysDuration: json["days_duration"],
    profit: json["profit"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "name": name,
    "hash_id": hashId,
    "created_date": createdDate?.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
    "days_duration": daysDuration,
    "profit": profit,
    "status": status,
  };
}

class Lending {
  String? totalllendigpool;
  String? lendingpools;

  Lending({
    this.totalllendigpool,
    this.lendingpools,
  });

  factory Lending.fromJson(Map<String, dynamic> json) => Lending(
    totalllendigpool: json["Totalllendigpool"],
    lendingpools: json["lendingpools"],
  );

  Map<String, dynamic> toJson() => {
    "Totalllendigpool": totalllendigpool,
    "lendingpools": lendingpools,
  };
}
