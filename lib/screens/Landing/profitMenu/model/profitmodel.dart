// To parse this JSON data, do
//
//     final profitModel = profitModelFromJson(jsonString);

import 'dart:convert';

ProfitModel profitModelFromJson(String str) => ProfitModel.fromJson(json.decode(str));

String profitModelToJson(ProfitModel data) => json.encode(data.toJson());

class ProfitModel {
  String? status;
  String? message;
  Data? data;

  ProfitModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProfitModel.fromJson(Map<String, dynamic> json) => ProfitModel(
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
  List<Value>? values;

  Data({
    this.lending,
    this.values,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    lending: json["Lending"] == null ? null : Lending.fromJson(json["Lending"]),
    values: json["values"] == null ? [] : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Lending": lending?.toJson(),
    "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
  };
}

class Lending {
  String? totalBonus;
  String? totalLending;

  Lending({
    this.totalBonus,
    this.totalLending,
  });

  factory Lending.fromJson(Map<String, dynamic> json) => Lending(
    totalBonus: json["total_bonus"],
    totalLending: json["total_lending"],
  );

  Map<String, dynamic> toJson() => {
    "total_bonus": totalBonus,
    "total_lending": totalLending,
  };
}

class Value {
  String? rankName;
  String? currentMonth;
  String? activeount;
  String? inactivecount;
  String? leftpool;
  String? rightpool;
  String? directincome;
  String? levelincome;
  String? todayincent;
  String? totalcollabincent;

  Value({
    this.rankName,
    this.currentMonth,
    this.activeount,
    this.inactivecount,
    this.leftpool,
    this.rightpool,
    this.directincome,
    this.levelincome,
    this.todayincent,
    this.totalcollabincent,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    rankName: json["Rank_Name"],
    currentMonth: json["Current_month"],
    activeount: json["Activeount"],
    inactivecount: json["inactivecount"],
    leftpool: json["Leftpool"],
    rightpool: json["Rightpool"],
    directincome: json["Directincome"],
    levelincome: json["Levelincome"],
    todayincent: json["Todayincent"],
    totalcollabincent: json["totalcollabincent"],
  );

  Map<String, dynamic> toJson() => {
    "Rank_Name": rankName,
    "Current_month": currentMonth,
    "Activeount": activeount,
    "inactivecount": inactivecount,
    "Leftpool": leftpool,
    "Rightpool": rightpool,
    "Directincome": directincome,
    "Levelincome": levelincome,
    "Todayincent": todayincent,
    "totalcollabincent": totalcollabincent,
  };
}
