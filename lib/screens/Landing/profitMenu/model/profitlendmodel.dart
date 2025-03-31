// To parse this JSON data, do
//
//     final profitLendingModel = profitLendingModelFromJson(jsonString);

import 'dart:convert';

ProfitLendingModel profitLendingModelFromJson(String str) => ProfitLendingModel.fromJson(json.decode(str));

String profitLendingModelToJson(ProfitLendingModel data) => json.encode(data.toJson());

class ProfitLendingModel {
  String? status;
  String? message;
  List<Datum>? data;

  ProfitLendingModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProfitLendingModel.fromJson(Map<String, dynamic> json) => ProfitLendingModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? csqDeposit;
  DateTime? matureDate;
  String? hashId;
  DateTime? createdDate;
  String? status;
  String? reinvestStatus;
  String? daysDuration;
  String? profit;

  Datum({
    this.csqDeposit,
    this.matureDate,
    this.hashId,
    this.createdDate,
    this.status,
    this.reinvestStatus,
    this.daysDuration,
    this.profit,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    csqDeposit: json["csq_deposit"],
    matureDate: json["mature_date"] == null ? null : DateTime.parse(json["mature_date"]),
    hashId: json["hash_id"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    status: json["status"],
    reinvestStatus: json["reinvest_status"],
    daysDuration: json["days_duration"],
    profit: json["profit"],
  );

  Map<String, dynamic> toJson() => {
    "csq_deposit": csqDeposit,
    "mature_date": matureDate?.toIso8601String(),
    "hash_id": hashId,
    "created_date": createdDate?.toIso8601String(),
    "status": status,
    "reinvest_status": reinvestStatus,
    "days_duration": daysDuration,
    "profit": profit,
  };
}
