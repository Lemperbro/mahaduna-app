import 'dart:convert';

AllPlaylist allPlaylistFromJson(String str) => AllPlaylist.fromJson(json.decode(str));

String allPlaylistToJson(AllPlaylist data) => json.encode(data.toJson());

class AllPlaylist {
    final int? currentPage;
    final List<Datum>? data;
    final String? firstPageUrl;
    final int? from;
    final int? lastPage;
    final String? lastPageUrl;
    final List<Link>? links;
    final dynamic nextPageUrl;
    final String? path;
    final int? perPage;
    final dynamic prevPageUrl;
    final int? to;
    final int? total;

    AllPlaylist({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory AllPlaylist.fromJson(Map<String, dynamic> json) => AllPlaylist(
        currentPage: json["current_page"],
        data: json["data"] != null ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))) : null,
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] != null ? List<Link>.from(json["links"].map((x) => Link.fromJson(x))) : null,
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data != null ? List<dynamic>.from(data!.map((x) => x.toJson())) : null,
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links != null ? List<dynamic>.from(links!.map((x) => x.toJson())) : null,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    final String? kind;
    final String? etag;
    final String? id;
    final Snippet? snippet;
    final ContentDetails? contentDetails;

    Datum({
        this.kind,
        this.etag,
        this.id,
        this.snippet,
        this.contentDetails,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: json["snippet"] != null ? Snippet.fromJson(json["snippet"]) : null,
        contentDetails: json["contentDetails"] == null ? null : ContentDetails.fromJson(json["contentDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet?.toJson(),
        "contentDetails": contentDetails?.toJson(),
    };
}

class ContentDetails {
    final int? itemCount;

    ContentDetails({
        this.itemCount,
    });

    factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        itemCount: json["itemCount"],
    );

    Map<String, dynamic> toJson() => {
        "itemCount": itemCount,
    };
}

class Snippet {
    final DateTime? publishedAt;
    final String? channelId;
    final String? title;
    final String? description;
    final Thumbnails? thumbnails;
    final String? channelTitle;
    final Localized? localized;

    Snippet({
        this.publishedAt,
        this.channelId,
        this.title,
        this.description,
        this.thumbnails,
        this.channelTitle,
        this.localized,
    });

    factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"] != null ? DateTime.parse(json["publishedAt"]) : null,
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"] != null ? Thumbnails.fromJson(json["thumbnails"]) : null,
        channelTitle: json["channelTitle"],
        localized: json["localized"] != null ? Localized.fromJson(json["localized"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails?.toJson(),
        "channelTitle": channelTitle,
        "localized": localized?.toJson(),
    };
}

class Localized {
    final String? title;
    final String? description;

    Localized({
        this.title,
        this.description,
    });

    factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}

class Thumbnails {
    final Default? thumbnailsDefault;
    final Default? medium;
    final Default? high;
    final Default? standard;
    final Default? maxres;

    Thumbnails({
        this.thumbnailsDefault,
        this.medium,
        this.high,
        this.standard,
        this.maxres,
    });

    factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: json["default"] != null ? Default.fromJson(json["default"]) : null,
        medium: json["medium"] != null ? Default.fromJson(json["medium"]) : null,
        high: json["high"] != null ? Default.fromJson(json["high"]) : null,
        standard: json["standard"] != null ? Default.fromJson(json["standard"]) : null,
        maxres: json["maxres"] != null ? Default.fromJson(json["maxres"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault?.toJson(),
        "medium": medium?.toJson(),
        "high": high?.toJson(),
        "standard": standard?.toJson(),
        "maxres": maxres?.toJson(),
    };
}

class Default {
    final String? url;
    final int? width;
    final int? height;

    Default({
        this.url,
        this.width,
        this.height,
    });

    factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
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
