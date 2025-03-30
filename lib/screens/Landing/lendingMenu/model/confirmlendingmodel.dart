// To parse this JSON data, do
//
//     final confirmLendingModel = confirmLendingModelFromJson(jsonString);

import 'dart:convert';

ConfirmLendingModel confirmLendingModelFromJson(String str) => ConfirmLendingModel.fromJson(json.decode(str));

String confirmLendingModelToJson(ConfirmLendingModel data) => json.encode(data.toJson());

class ConfirmLendingModel {
  String? status;
  String? message;
  String? data;

  ConfirmLendingModel({
    this.status,
    this.message,
    this.data,
  });

  factory ConfirmLendingModel.fromJson(Map<String, dynamic> json) => ConfirmLendingModel(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
