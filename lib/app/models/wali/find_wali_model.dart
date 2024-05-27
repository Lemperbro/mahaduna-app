// To parse this JSON data, do
//
//     final findWaliModel = findWaliModelFromJson(jsonString);

import 'dart:convert';

FindWaliModel findWaliModelFromJson(String str) => FindWaliModel.fromJson(json.decode(str));

String findWaliModelToJson(FindWaliModel data) => json.encode(data.toJson());

class FindWaliModel {
    final Data? data;

    FindWaliModel({
        this.data,
    });

    factory FindWaliModel.fromJson(Map<String, dynamic> json) => FindWaliModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    final int? waliId;
    final String? nama;
    final String? email;
    final String? alamat;
    final String? telp;
    final List<Santri>? santri;

    Data({
        this.waliId,
        this.nama,
        this.email,
        this.alamat,
        this.telp,
        this.santri,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        waliId: json["wali_id"],
        nama: json["nama"],
        email: json["email"],
        alamat: json["alamat"],
        telp: json["telp"],
        santri: json["santri"] == null ? [] : List<Santri>.from(json["santri"]!.map((x) => Santri.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "wali_id": waliId,
        "nama": nama,
        "email": email,
        "alamat": alamat,
        "telp": telp,
        "santri": santri == null ? [] : List<dynamic>.from(santri!.map((x) => x.toJson())),
    };
}

class Santri {
    final int? santriId;
    final String? nama;
    final dynamic nisn;
    final String? jenjang;
    final DateTime? tglLahir;
    final DateTime? tglKeluar;
    final String? jenisKelamin;
    final String? status;
    final DateTime? createdAt;

    Santri({
        this.santriId,
        this.nama,
        this.nisn,
        this.jenjang,
        this.tglLahir,
        this.tglKeluar,
        this.jenisKelamin,
        this.status,
        this.createdAt,
    });

    factory Santri.fromJson(Map<String, dynamic> json) => Santri(
        santriId: json["santri_id"],
        nama: json["nama"],
        nisn: json["nisn"],
        jenjang: json["jenjang"],
        tglLahir: json["tgl_lahir"] == null ? null : DateTime.parse(json["tgl_lahir"]),
        tglKeluar: json["tgl_keluar"] == null ? null : DateTime.parse(json["tgl_keluar"]),
        jenisKelamin: json["jenis_kelamin"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "santri_id": santriId,
        "nama": nama,
        "nisn": nisn,
        "jenjang": jenjang,
        "tgl_lahir": "${tglLahir!.year.toString().padLeft(4, '0')}-${tglLahir!.month.toString().padLeft(2, '0')}-${tglLahir!.day.toString().padLeft(2, '0')}",
        "tgl_masuk": "${tglKeluar!.year.toString().padLeft(4, '0')}-${tglKeluar!.month.toString().padLeft(2, '0')}-${tglKeluar!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
    };
}
