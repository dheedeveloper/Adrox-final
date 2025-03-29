// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String? status;
  String? message;
  Data? data;

  RegisterModel({
    this.status,
    this.message,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
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
  String? email;
  String? referralId;
  String? mnemonic;
  String? sponserId;

  Data({
    this.email,
    this.referralId,
    this.mnemonic,
    this.sponserId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
    referralId: json["referralId"],
    mnemonic: json["mnemonic"],
    sponserId: json["sponser_id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "referralId": referralId,
    "mnemonic": mnemonic,
    "sponser_id": sponserId,
  };
}
