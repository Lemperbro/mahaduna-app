// To parse this JSON data, do
//
//     final waliLoginModel = waliLoginModelFromJson(jsonString);

import 'dart:convert';

WaliLoginModel waliLoginModelFromJson(String str) => WaliLoginModel.fromJson(json.decode(str));

String waliLoginModelToJson(WaliLoginModel data) => json.encode(data.toJson());

class WaliLoginModel {
    final Data? data;

    WaliLoginModel({
        this.data,
    });

    factory WaliLoginModel.fromJson(Map<String, dynamic> json) => WaliLoginModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    final String? token;

    Data({
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
