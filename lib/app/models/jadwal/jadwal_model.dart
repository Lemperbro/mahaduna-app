// To parse this JSON data, do
//
//     final jadwalModel = jadwalModelFromJson(jsonString);

import 'dart:convert';

JadwalModel jadwalModelFromJson(String str) => JadwalModel.fromJson(json.decode(str));

String jadwalModelToJson(JadwalModel data) => json.encode(data.toJson());

class JadwalModel {
    final List<Datum>? data;

    JadwalModel({
        this.data,
    });

    factory JadwalModel.fromJson(Map<String, dynamic> json) => JadwalModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final int? jadwalId;
    final String? startTime;
    final String? endTime;
    final String? jadwal;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic deletedAt;

    Datum({
        this.jadwalId,
        this.startTime,
        this.endTime,
        this.jadwal,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        jadwalId: json["jadwal_id"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        jadwal: json["jadwal"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "jadwal_id": jadwalId,
        "start_time": startTime,
        "end_time": endTime,
        "jadwal": jadwal,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
