// To parse this JSON data, do
//
//     final inActiveTeamModel = inActiveTeamModelFromJson(jsonString);

import 'dart:convert';

InActiveTeamModel inActiveTeamModelFromJson(String str) => InActiveTeamModel.fromJson(json.decode(str));

String inActiveTeamModelToJson(InActiveTeamModel data) => json.encode(data.toJson());

class InActiveTeamModel {
  String? status;
  String? message;
  Data? data;

  InActiveTeamModel({
    this.status,
    this.message,
    this.data,
  });

  factory InActiveTeamModel.fromJson(Map<String, dynamic> json) => InActiveTeamModel(
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
  String? sponsorUsername;
  String? referralId;
  DateTime? time;

  History({
    this.sponsorUsername,
    this.referralId,
    this.time,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    sponsorUsername: json["sponsor_username"],
    referralId: json["referral_id"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "sponsor_username": sponsorUsername,
    "referral_id": referralId,
    "time": time?.toIso8601String(),
  };
}

class Lending {
  String? totalllendig;
  String? totalinactivecount;

  Lending({
    this.totalllendig,
    this.totalinactivecount,
  });

  factory Lending.fromJson(Map<String, dynamic> json) => Lending(
    totalllendig: json["Totalllendig"],
    totalinactivecount: json["Totalinactivecount"],
  );

  Map<String, dynamic> toJson() => {
    "Totalllendig": totalllendig,
    "Totalinactivecount": totalinactivecount,
  };
}
