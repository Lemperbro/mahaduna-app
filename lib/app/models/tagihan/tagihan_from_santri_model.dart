// To parse this JSON data, do
//
//     final allTagihanSantriModel = allTagihanSantriModelFromJson(jsonString);

import 'dart:convert';

AllTagihanSantriModel allTagihanSantriModelFromJson(String str) => AllTagihanSantriModel.fromJson(json.decode(str));

String allTagihanSantriModelToJson(AllTagihanSantriModel data) => json.encode(data.toJson());

class AllTagihanSantriModel {
    final List<Datum>? data;

    AllTagihanSantriModel({
        this.data,
    });

    factory AllTagihanSantriModel.fromJson(Map<String, dynamic> json) => AllTagihanSantriModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final int? tagihanId;
    final int? santriId;
    final Santri? santri;
    final Transaksi? transaksi;
    final String? label;
    final int? price;
    final DateTime? date;
    final String? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Datum({
        this.tagihanId,
        this.santriId,
        this.santri,
        this.transaksi,
        this.label,
        this.price,
        this.date,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tagihanId: json["tagihan_id"],
        santriId: json["santri_id"],
        santri: json["santri"] == null ? null : Santri.fromJson(json["santri"]),
        transaksi: json["transaksi"] == null ? null : Transaksi.fromJson(json["transaksi"]),
        label: json["label"],
        price: json["price"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "tagihan_id": tagihanId,
        "santri_id": santriId,
        "santri": santri?.toJson(),
        "transaksi": transaksi?.toJson(),
        "label": label,
        "price": price,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Santri {
    final int? santriId;
    final String? nama;
    final dynamic nisn;
    final Jenjang? jenjang;
    final dynamic tglMasuk;
    final String? jenisKelamin;
    final String? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic deletedAt;

    Santri({
        this.santriId,
        this.nama,
        this.nisn,
        this.jenjang,
        this.tglMasuk,
        this.jenisKelamin,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Santri.fromJson(Map<String, dynamic> json) => Santri(
        santriId: json["santri_id"],
        nama: json["nama"],
        nisn: json["nisn"],
        jenjang: json["jenjang"] == null ? null : Jenjang.fromJson(json["jenjang"]),
        tglMasuk: json["tgl_masuk"],
        jenisKelamin: json["jenis_kelamin"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "santri_id": santriId,
        "nama": nama,
        "nisn": nisn,
        "jenjang": jenjang?.toJson(),
        "tgl_masuk": tglMasuk,
        "jenis_kelamin": jenisKelamin,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class Jenjang {
    final int? jenjangId;
    final String? jenjang;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic deletedAt;

    Jenjang({
        this.jenjangId,
        this.jenjang,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Jenjang.fromJson(Map<String, dynamic> json) => Jenjang(
        jenjangId: json["jenjang_id"],
        jenjang: json["jenjang"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "jenjang_id": jenjangId,
        "jenjang": jenjang,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class Transaksi {
    final int? transaksiId;
    final int? tagihanId;
    final String? invoiceId;
    final String? externalId;
    final String? paymentLink;
    final int? price;
    final int? pay;
    final String? paymentType;
    final String? paymentStatus;
    final DateTime? expired;
    final dynamic userCreated;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic userUpdated;
    final dynamic deletedAt;
    final dynamic userDeleted;
    final dynamic deleted;

    Transaksi({
        this.transaksiId,
        this.tagihanId,
        this.invoiceId,
        this.externalId,
        this.paymentLink,
        this.price,
        this.pay,
        this.paymentType,
        this.paymentStatus,
        this.expired,
        this.userCreated,
        this.createdAt,
        this.updatedAt,
        this.userUpdated,
        this.deletedAt,
        this.userDeleted,
        this.deleted,
    });

    factory Transaksi.fromJson(Map<String, dynamic> json) => Transaksi(
        transaksiId: json["transaksi_id"],
        tagihanId: json["tagihan_id"],
        invoiceId: json["invoice_id"],
        externalId: json["external_id"],
        paymentLink: json["payment_link"],
        price: json["price"],
        pay: json["pay"],
        paymentType: json["payment_type"],
        paymentStatus: json["payment_status"],
        expired: json["expired"] == null ? null : DateTime.parse(json["expired"]),
        userCreated: json["user_created"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userUpdated: json["user_updated"],
        deletedAt: json["deleted_at"],
        userDeleted: json["user_deleted"],
        deleted: json["deleted"],
    );

    Map<String, dynamic> toJson() => {
        "transaksi_id": transaksiId,
        "tagihan_id": tagihanId,
        "invoice_id": invoiceId,
        "external_id": externalId,
        "payment_link": paymentLink,
        "price": price,
        "pay": pay,
        "payment_type": paymentType,
        "payment_status": paymentStatus,
        "expired": expired?.toIso8601String(),
        "user_created": userCreated,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_updated": userUpdated,
        "deleted_at": deletedAt,
        "user_deleted": userDeleted,
        "deleted": deleted,
    };
}
