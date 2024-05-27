// To parse this JSON data, do
//
//     final allMajalahModel = allMajalahModelFromJson(jsonString);

import 'dart:convert';

AllMajalahModel allMajalahModelFromJson(String str) => AllMajalahModel.fromJson(json.decode(str));

String allMajalahModelToJson(AllMajalahModel data) => json.encode(data.toJson());

class AllMajalahModel {
    final List<Datum>? data;
    final Links? links;
    final Meta? meta;

    AllMajalahModel({
        this.data,
        this.links,
        this.meta,
    });

    factory AllMajalahModel.fromJson(Map<String, dynamic> json) => AllMajalahModel(
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
    final int? majalahId;
    final String? judul;
    final String? bannerImage;
    final String? source;
    final int? views;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Datum({
        this.majalahId,
        this.judul,
        this.bannerImage,
        this.source,
        this.views,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        majalahId: json["majalah_id"],
        judul: json["judul"],
        bannerImage: json["bannerImage"],
        source: json["source"],
        views: json["views"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "majalah_id": majalahId,
        "judul": judul,
        "bannerImage": bannerImage,
        "source": source,
        "views": views,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Links {
    final String? first;
    final String? last;
    final dynamic prev;
    final String? next;

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