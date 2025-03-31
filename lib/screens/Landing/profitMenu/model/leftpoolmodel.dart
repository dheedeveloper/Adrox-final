// To parse this JSON data, do
//
//     final leftPoolModel = leftPoolModelFromJson(jsonString);

import 'dart:convert';

LeftPoolModel leftPoolModelFromJson(String str) => LeftPoolModel.fromJson(json.decode(str));

String leftPoolModelToJson(LeftPoolModel data) => json.encode(data.toJson());

class LeftPoolModel {
  String? status;
  String? message;
  Data? data;

  LeftPoolModel({
    this.status,
    this.message,
    this.data,
  });

  factory LeftPoolModel.fromJson(Map<String, dynamic> json) => LeftPoolModel(
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
    history: json["History"] == null ? [] : List<History>.from(json["History"]!.map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Lending": lending?.toJson(),
    "History": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
  };
}

class History {
  String? amount;
  String? sponsorUsername;
  String? referralId;
  DateTime? time;

  History({
    this.amount,
    this.sponsorUsername,
    this.referralId,
    this.time,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    amount: json["Amount"],
    sponsorUsername: json["sponsor_username"],
    referralId: json["referral_id"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "Amount": amount,
    "sponsor_username": sponsorUsername,
    "referral_id": referralId,
    "time": time?.toIso8601String(),
  };
}

class Lending {
  String? totalpool;
  String? totalmembers;

  Lending({
    this.totalpool,
    this.totalmembers,
  });

  factory Lending.fromJson(Map<String, dynamic> json) => Lending(
    totalpool: json["Totalpool"],
    totalmembers: json["Totalmembers"],
  );

  Map<String, dynamic> toJson() => {
    "Totalpool": totalpool,
    "Totalmembers": totalmembers,
  };
}
