// To parse this JSON data, do
//
//     final profitLendingModel = profitLendingModelFromJson(jsonString);

import 'dart:convert';

ProfitLendingModel profitLendingModelFromJson(String str) => ProfitLendingModel.fromJson(json.decode(str));

String profitLendingModelToJson(ProfitLendingModel data) => json.encode(data.toJson());

class ProfitLendingModel {
  String? status;
  String? message;
  Data? data;

  ProfitLendingModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProfitLendingModel.fromJson(Map<String, dynamic> json) => ProfitLendingModel(
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
  Bonus? bonus;
  List<History>? history;

  Data({
    this.bonus,
    this.history,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bonus: json["bonus"] == null ? null : Bonus.fromJson(json["bonus"]),
    history: json["History"] == null ? [] : List<History>.from(json["History"]!.map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bonus": bonus?.toJson(),
    "History": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
  };
}

class Bonus {
  String? todaybonus;
  String? totalbonus;

  Bonus({
    this.todaybonus,
    this.totalbonus,
  });

  factory Bonus.fromJson(Map<String, dynamic> json) => Bonus(
    todaybonus: json["Todaybonus"],
    totalbonus: json["Totalbonus"],
  );

  Map<String, dynamic> toJson() => {
    "Todaybonus": todaybonus,
    "Totalbonus": totalbonus,
  };
}

class History {
  String? tokenAmount;
  String? description;
  DateTime? time;

  History({
    this.tokenAmount,
    this.description,
    this.time,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    tokenAmount: json["token_amount"],
    description: json["description"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "token_amount": tokenAmount,
    "description": description,
    "time": time?.toIso8601String(),
  };
}
