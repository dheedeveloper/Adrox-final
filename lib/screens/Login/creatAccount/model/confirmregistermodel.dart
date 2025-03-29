// To parse this JSON data, do
//
//     final confirmRegisterModel = confirmRegisterModelFromJson(jsonString);

import 'dart:convert';

ConfirmRegisterModel confirmRegisterModelFromJson(String str) => ConfirmRegisterModel.fromJson(json.decode(str));

String confirmRegisterModelToJson(ConfirmRegisterModel data) => json.encode(data.toJson());

class ConfirmRegisterModel {
  String? status;
  String? message;
  Data? data;

  ConfirmRegisterModel({
    this.status,
    this.message,
    this.data,
  });

  factory ConfirmRegisterModel.fromJson(Map<String, dynamic> json) => ConfirmRegisterModel(
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
  String? referralId;
  String? twofaSecret;
  String? twofaCodePath;

  Data({
    this.referralId,
    this.twofaSecret,
    this.twofaCodePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    referralId: json["referralId"],
    twofaSecret: json["twofaSecret"],
    twofaCodePath: json["twofaCodePath"],
  );

  Map<String, dynamic> toJson() => {
    "referralId": referralId,
    "twofaSecret": twofaSecret,
    "twofaCodePath": twofaCodePath,
  };
}
