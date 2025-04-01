

// To parse this JSON data, do
//
//     final collabModel = collabModelFromJson(jsonString);

import 'dart:convert';

CollabModel collabModelFromJson(String str) => CollabModel.fromJson(json.decode(str));

String collabModelToJson(CollabModel data) => json.encode(data.toJson());

class CollabModel {
  String? status;
  String? message;
  Data? data;

  CollabModel({
    this.status,
    this.message,
    this.data,
  });

  factory CollabModel.fromJson(Map<String, dynamic> json) => CollabModel(
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
  Collab? collab;
  List<History>? history;

  Data({
    this.collab,
    this.history,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    collab: json["collab"] == null ? null : Collab.fromJson(json["collab"]),
    history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "collab": collab?.toJson(),
    "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
  };
}

class Collab {
  String? totalcollabincentives;
  String? currentpoolmatch;

  Collab({
    this.totalcollabincentives,
    this.currentpoolmatch,
  });

  factory Collab.fromJson(Map<String, dynamic> json) => Collab(
    totalcollabincentives: json["Totalcollabincentives"],
    currentpoolmatch: json["Currentpoolmatch"],
  );

  Map<String, dynamic> toJson() => {
    "Totalcollabincentives": totalcollabincentives,
    "Currentpoolmatch": currentpoolmatch,
  };
}

class History {
  String? rankname;
  String? amount;
  String? date;
  String? overallRankeligible;
  String? leftlegAmount;
  String? riightlegAmount;
  DateTime? createdAt;

  History({
    this.rankname,
    this.amount,
    this.date,
    this.overallRankeligible,
    this.leftlegAmount,
    this.riightlegAmount,
    this.createdAt,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    rankname: json["rankname"],
    amount: json["amount"],
    date: json["date"],
    overallRankeligible: json["overall_rankeligible"],
    leftlegAmount: json["leftleg_amount"],
    riightlegAmount: json["riightleg_amount"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "rankname": rankname,
    "amount": amount,
    "date": date,
    "overall_rankeligible": overallRankeligible,
    "leftleg_amount": leftlegAmount,
    "riightleg_amount": riightlegAmount,
    "created_at": createdAt?.toIso8601String(),
  };
}
