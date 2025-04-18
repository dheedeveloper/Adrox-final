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
  String? name;
  String? title;
  String? value;

  Value({
    this.name,
    this.title,
    this.value,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    name: json["name"],
    title: json["title"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "title": title,
    "value": value,
  };
}
