// To parse this JSON data, do
//
//     final createPaymentModels = createPaymentModelsFromJson(jsonString);

import 'dart:convert';

CreatePaymentModels createPaymentModelsFromJson(String str) => CreatePaymentModels.fromJson(json.decode(str));

String createPaymentModelsToJson(CreatePaymentModels data) => json.encode(data.toJson());

class CreatePaymentModels {
    final Data? data;

    CreatePaymentModels({
        this.data,
    });

    factory CreatePaymentModels.fromJson(Map<String, dynamic> json) => CreatePaymentModels(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
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
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic deletedAt;

    Data({
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
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
