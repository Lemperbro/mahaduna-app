// To parse this JSON data, do
//
//     final allArtikelModel = allArtikelModelFromJson(jsonString);

import 'dart:convert';

AllArtikelModel allArtikelModelFromJson(String str) => AllArtikelModel.fromJson(json.decode(str));

String allArtikelModelToJson(AllArtikelModel data) => json.encode(data.toJson());

class AllArtikelModel {
    final List<Datum>? data;
    final Links? links;
    final Meta? meta;

    AllArtikelModel({
        this.data,
        this.links,
        this.meta,
    });

    factory AllArtikelModel.fromJson(Map<String, dynamic> json) => AllArtikelModel(
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
    final int? artikelId;
    final String? judul;
    final String? slug;
    final List<Kategori>? kategori;
    final String? bannerImage;
    final String? isi;
    final int? views;
    final int? userCreated;
    final DateTime? createdAt;
    final dynamic updatedAt;
    final dynamic userUpdated;
    final dynamic deletedAt;
    final dynamic userDeleted;
    final dynamic deleted;

    Datum({
        this.artikelId,
        this.judul,
        this.slug,
        this.kategori,
        this.bannerImage,
        this.isi,
        this.views,
        this.userCreated,
        this.createdAt,
        this.updatedAt,
        this.userUpdated,
        this.deletedAt,
        this.userDeleted,
        this.deleted,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        artikelId: json["artikel_id"],
        judul: json["judul"],
        slug: json["slug"],
        kategori: json["kategori"] == null ? [] : List<Kategori>.from(json["kategori"]!.map((x) => Kategori.fromJson(x))),
        bannerImage: json["bannerImage"],
        isi: json["isi"],
        views: json["views"],
        userCreated: json["user_created"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        userUpdated: json["user_updated"],
        deletedAt: json["deleted_at"],
        userDeleted: json["user_deleted"],
        deleted: json["deleted"],
    );

    Map<String, dynamic> toJson() => {
        "artikel_id": artikelId,
        "judul": judul,
        "slug": slug,
        "kategori": kategori == null ? [] : List<dynamic>.from(kategori!.map((x) => x.toJson())),
        "bannerImage": bannerImage,
        "isi": isi,
        "views": views,
        "user_created": userCreated,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "user_updated": userUpdated,
        "deleted_at": deletedAt,
        "user_deleted": userDeleted,
        "deleted": deleted,
    };
}

class Kategori {
    final int? kategoriId;
    final String? kategori;

    Kategori({
        this.kategoriId,
        this.kategori,
    });

    factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        kategoriId: json["kategori_id"],
        kategori: json["kategori"],
    );

    Map<String, dynamic> toJson() => {
        "kategori_id": kategoriId,
        "kategori": kategori,
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
