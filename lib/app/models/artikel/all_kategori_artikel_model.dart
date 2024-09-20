// To parse this JSON data, do
//
//     final allKategoriArtikelModel = allKategoriArtikelModelFromJson(jsonString);

import 'dart:convert';

AllKategoriArtikelModel allKategoriArtikelModelFromJson(String str) => AllKategoriArtikelModel.fromJson(json.decode(str));

String allKategoriArtikelModelToJson(AllKategoriArtikelModel data) => json.encode(data.toJson());

class AllKategoriArtikelModel {
    final List<Datum>? data;

    AllKategoriArtikelModel({
        this.data,
    });

    factory AllKategoriArtikelModel.fromJson(Map<String, dynamic> json) => AllKategoriArtikelModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final int? kategoriId;
    final String? kategori;
    final int? userCreated;
    final DateTime? createdAt;
    final dynamic updatedAt;
    final dynamic userUpdated;
    final dynamic deletedAt;
    final dynamic userDeleted;
    final dynamic deleted;

    Datum({
        this.kategoriId,
        this.kategori,
        this.userCreated,
        this.createdAt,
        this.updatedAt,
        this.userUpdated,
        this.deletedAt,
        this.userDeleted,
        this.deleted,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kategoriId: json["kategori_id"],
        kategori: json["kategori"],
        userCreated: json["user_created"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        userUpdated: json["user_updated"],
        deletedAt: json["deleted_at"],
        userDeleted: json["user_deleted"],
        deleted: json["deleted"],
    );

    Map<String, dynamic> toJson() => {
        "kategori_id": kategoriId,
        "kategori": kategori,
        "user_created": userCreated,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "user_updated": userUpdated,
        "deleted_at": deletedAt,
        "user_deleted": userDeleted,
        "deleted": deleted,
    };
}
