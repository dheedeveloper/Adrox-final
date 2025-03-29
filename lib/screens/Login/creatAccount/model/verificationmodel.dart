// To parse this JSON data, do
//
//     final verificationModel = verificationModelFromJson(jsonString);

import 'dart:convert';

VerificationModel verificationModelFromJson(String str) => VerificationModel.fromJson(json.decode(str));

String verificationModelToJson(VerificationModel data) => json.encode(data.toJson());

class VerificationModel {
  String? twofactorsecret;
  String? twofacode;

  VerificationModel({
    this.twofactorsecret,
    this.twofacode,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) => VerificationModel(
    twofactorsecret: json["twofactorsecret"],
    twofacode: json["twofacode"],
  );

  Map<String, dynamic> toJson() => {
    "twofactorsecret": twofactorsecret,
    "twofacode": twofacode,
  };
}
