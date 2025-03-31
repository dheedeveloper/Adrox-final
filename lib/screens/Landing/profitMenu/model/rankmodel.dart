// To parse this JSON data, do
//
//     final rankModel = rankModelFromJson(jsonString);

import 'dart:convert';

RankModel rankModelFromJson(String str) => RankModel.fromJson(json.decode(str));

String rankModelToJson(RankModel data) => json.encode(data.toJson());

class RankModel {
  String? status;
  String? message;
  Data? data;

  RankModel({
    this.status,
    this.message,
    this.data,
  });

  factory RankModel.fromJson(Map<String, dynamic> json) => RankModel(
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
  Rankrewards? rankrewards;
  List<History>? history;

  Data({
    this.rankrewards,
    this.history,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    rankrewards: json["rankrewards"] == null ? null : Rankrewards.fromJson(json["rankrewards"]),
    history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rankrewards": rankrewards?.toJson(),
    "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
  };
}

class History {
  String? amount;
  String? rankname;
  String? overallRankeligible;
  String? leftlegAmount;
  String? riightlegAmount;
  String? leftlegUser;
  String? rightlegUser;
  DateTime? createdAt;
  bool? rank;

  History({
    this.amount,
    this.rankname,
    this.overallRankeligible,
    this.leftlegAmount,
    this.riightlegAmount,
    this.leftlegUser,
    this.rightlegUser,
    this.createdAt,
    this.rank,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    amount: json["Amount"],
    rankname: json["rankname"],
    overallRankeligible: json["overall_rankeligible"],
    leftlegAmount: json["leftleg_amount"],
    riightlegAmount: json["riightleg_amount"],
    leftlegUser: json["leftleg_user"],
    rightlegUser: json["rightleg_user"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    rank: json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "Amount": amount,
    "rankname": rankname,
    "overall_rankeligible": overallRankeligible,
    "leftleg_amount": leftlegAmount,
    "riightleg_amount": riightlegAmount,
    "leftleg_user": leftlegUser,
    "rightleg_user": rightlegUser,
    "created_at": createdAt?.toIso8601String(),
    "rank": rank,
  };
}

class Rankrewards {
  String? totalrankreward;
  String? currentpoolmatch;
  String? currentmonthrank;
  String? leftpool;
  String? rightpool;

  Rankrewards({
    this.totalrankreward,
    this.currentpoolmatch,
    this.currentmonthrank,
    this.leftpool,
    this.rightpool,
  });

  factory Rankrewards.fromJson(Map<String, dynamic> json) => Rankrewards(
    totalrankreward: json["Totalrankreward"],
    currentpoolmatch: json["Currentpoolmatch"],
    currentmonthrank: json["Currentmonthrank"],
    leftpool: json["leftpool"],
    rightpool: json["rightpool"],
  );

  Map<String, dynamic> toJson() => {
    "Totalrankreward": totalrankreward,
    "Currentpoolmatch": currentpoolmatch,
    "Currentmonthrank": currentmonthrank,
    "leftpool": leftpool,
    "rightpool": rightpool,
  };
}
