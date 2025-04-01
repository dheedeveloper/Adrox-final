// To parse this JSON data, do
//
//     final referralModel = referralModelFromJson(jsonString);

import 'dart:convert';

ReferralModel referralModelFromJson(String str) => ReferralModel.fromJson(json.decode(str));

String referralModelToJson(ReferralModel data) => json.encode(data.toJson());

class ReferralModel {
  String? status;
  String? message;
  Data? data;

  ReferralModel({
    this.status,
    this.message,
    this.data,
  });

  factory ReferralModel.fromJson(Map<String, dynamic> json) => ReferralModel(
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
  String? description;
  String? sponsorUsername;
  String? referralId;
  DateTime? time;

  History({
    this.amount,
    this.description,
    this.sponsorUsername,
    this.referralId,
    this.time,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    amount: json["Amount"],
    description: json["description"],
    sponsorUsername: json["sponsor_username"],
    referralId: json["referral_id"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "Amount": amount,
    "description": description,
    "sponsor_username": sponsorUsername,
    "referral_id": referralId,
    "time": time?.toIso8601String(),
  };
}

class Lending {
  String? totalldirectbonus;
  String? totaldirectmembers;

  Lending({
    this.totalldirectbonus,
    this.totaldirectmembers,
  });

  factory Lending.fromJson(Map<String, dynamic> json) => Lending(
    totalldirectbonus: json["Totalldirectbonus"],
    totaldirectmembers: json["Totaldirectmembers"],
  );

  Map<String, dynamic> toJson() => {
    "Totalldirectbonus": totalldirectbonus,
    "Totaldirectmembers": totaldirectmembers,
  };
}
