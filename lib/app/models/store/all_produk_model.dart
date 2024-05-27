// To parse this JSON data, do
//
//     final storeAllModel = storeAllModelFromJson(jsonString);

import 'dart:convert';

StoreAllModel storeAllModelFromJson(String str) => StoreAllModel.fromJson(json.decode(str));

String storeAllModelToJson(StoreAllModel data) => json.encode(data.toJson());

class StoreAllModel {
    final List<Datum>? data;
    final Links? links;
    final Meta? meta;

    StoreAllModel({
        this.data,
        this.links,
        this.meta,
    });

    factory StoreAllModel.fromJson(Map<String, dynamic> json) => StoreAllModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
    };
}

class Datum {
    final int? produkId;
    final List<Image>? image;
    final String? label;
    final String? slug;
    final String? price;
    final int? stock;
    final String? deskripsi;
    final DateTime? createdAt;

    Datum({
        this.produkId,
        this.image,
        this.label,
        this.slug,
        this.price,
        this.stock,
        this.deskripsi,
        this.createdAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        produkId: json["produk_id"],
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
        label: json["label"],
        slug: json["slug"],
        price: json["price"],
        stock: json["stock"],
        deskripsi: json["deskripsi"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "produk_id": produkId,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "label": label,
        "slug": slug,
        "price": price,
        "stock": stock,
        "deskripsi": deskripsi,
        "created_at": createdAt?.toIso8601String(),
    };
}

class Image {
    final String? image;

    Image({
        this.image,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
    };
}

class Links {
    final String? first;
    final String? last;
    final dynamic prev;
    final dynamic next;

    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    final int? currentPage;
    final int? from;
    final int? lastPage;
    final List<Link>? links;
    final String? path;
    final int? perPage;
    final int? to;
    final int? total;

    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}

class Link {
    final String? url;
    final String? label;
    final bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
