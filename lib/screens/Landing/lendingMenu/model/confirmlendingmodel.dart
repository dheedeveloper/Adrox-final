// To parse this JSON data, do
//
//     final confirmLendingModel = confirmLendingModelFromJson(jsonString);

import 'dart:convert';

ConfirmLendingModel confirmLendingModelFromJson(String str) => ConfirmLendingModel.fromJson(json.decode(str));

String confirmLendingModelToJson(ConfirmLendingModel data) => json.encode(data.toJson());

class ConfirmLendingModel {
  String? status;
  String? message;
  Data? data;

  ConfirmLendingModel({
    this.status,
    this.message,
    this.data,
  });

  factory ConfirmLendingModel.fromJson(Map<String, dynamic> json) => ConfirmLendingModel(
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
  String? txHash;

  Data({
    this.txHash,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    txHash: json["txHash"],
  );

  Map<String, dynamic> toJson() => {
    "txHash": txHash,
  };
}
