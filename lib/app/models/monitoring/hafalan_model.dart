// To parse this JSON data, do
//
//     final hafalanModel = hafalanModelFromJson(jsonString);

import 'dart:convert';

HafalanModel hafalanModelFromJson(String str) => HafalanModel.fromJson(json.decode(str));

String hafalanModelToJson(HafalanModel data) => json.encode(data.toJson());

class HafalanModel {
    final List<List<Datum>>? data;
    final Links? links;
    final Meta? meta;

    HafalanModel({
        this.data,
        this.links,
        this.meta,
    });

    factory HafalanModel.fromJson(Map<String, dynamic> json) => HafalanModel(
        data: json["data"] == null ? [] : List<List<Datum>>.from(json["data"]!.map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
    };
}

class Datum {
    final int? monitorBulananId;
    final int? santriId;
    final String? progres;
    final DateTime? bulan;
    final int? userCreated;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic userUpdated;
    final dynamic deletedAt;
    final dynamic userDeleted;
    final dynamic deleted;

    Datum({
        this.monitorBulananId,
        this.santriId,
        this.progres,
        this.bulan,
        this.userCreated,
        this.createdAt,
        this.updatedAt,
        this.userUpdated,
        this.deletedAt,
        this.userDeleted,
        this.deleted,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        monitorBulananId: json["monitor_bulanan_id"],
        santriId: json["santri_id"],
        progres: json["progres"],
        bulan: json["bulan"] == null ? null : DateTime.parse(json["bulan"]),
        userCreated: json["user_created"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userUpdated: json["user_updated"],
        deletedAt: json["deleted_at"],
        userDeleted: json["user_deleted"],
        deleted: json["deleted"],
    );

    Map<String, dynamic> toJson() => {
        "monitor_bulanan_id": monitorBulananId,
        "santri_id": santriId,
        "progres": progres,
        "bulan": "${bulan!.year.toString().padLeft(4, '0')}-${bulan!.month.toString().padLeft(2, '0')}-${bulan!.day.toString().padLeft(2, '0')}",
        "user_created": userCreated,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_updated": userUpdated,
        "deleted_at": deletedAt,
        "user_deleted": userDeleted,
        "deleted": deleted,
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
