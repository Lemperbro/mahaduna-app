// To parse this JSON data, do
//
//     final findVideoModel = findVideoModelFromJson(jsonString);

import 'dart:convert';

FindVideoModel findVideoModelFromJson(String str) => FindVideoModel.fromJson(json.decode(str));

String findVideoModelToJson(FindVideoModel data) => json.encode(data.toJson());

class FindVideoModel {
    final String? kind;
    final String? etag;
    final List<Item>? items;
    final PageInfo? pageInfo;

    FindVideoModel({
        this.kind,
        this.etag,
        this.items,
        this.pageInfo,
    });

    factory FindVideoModel.fromJson(Map<String, dynamic> json) => FindVideoModel(
        kind: json["kind"],
        etag: json["etag"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "pageInfo": pageInfo?.toJson(),
    };
}

class Item {
    final String? kind;
    final String? etag;
    final String? id;
    final Snippet? snippet;
    final Player? player;

    Item({
        this.kind,
        this.etag,
        this.id,
        this.snippet,
        this.player,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet?.toJson(),
        "player": player?.toJson(),
    };
}

class Player {
    final String? embedHtml;

    Player({
        this.embedHtml,
    });

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        embedHtml: json["embedHtml"],
    );

    Map<String, dynamic> toJson() => {
        "embedHtml": embedHtml,
    };
}

class Snippet {
    final DateTime? publishedAt;
    final String? channelId;
    final String? title;
    final String? description;
    final Thumbnails? thumbnails;
    final String? channelTitle;
    final String? categoryId;
    final String? liveBroadcastContent;
    final Localized? localized;
    final String? defaultAudioLanguage;

    Snippet({
        this.publishedAt,
        this.channelId,
        this.title,
        this.description,
        this.thumbnails,
        this.channelTitle,
        this.categoryId,
        this.liveBroadcastContent,
        this.localized,
        this.defaultAudioLanguage,
    });

    factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        categoryId: json["categoryId"],
        liveBroadcastContent: json["liveBroadcastContent"],
        localized: json["localized"] == null ? null : Localized.fromJson(json["localized"]),
        defaultAudioLanguage: json["defaultAudioLanguage"],
    );

    Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails?.toJson(),
        "channelTitle": channelTitle,
        "categoryId": categoryId,
        "liveBroadcastContent": liveBroadcastContent,
        "localized": localized?.toJson(),
        "defaultAudioLanguage": defaultAudioLanguage,
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
        thumbnailsDefault: json["default"] == null ? null : Default.fromJson(json["default"]),
        medium: json["medium"] == null ? null : Default.fromJson(json["medium"]),
        high: json["high"] == null ? null : Default.fromJson(json["high"]),
        standard: json["standard"] == null ? null : Default.fromJson(json["standard"]),
        maxres: json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
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

class PageInfo {
    final int? totalResults;
    final int? resultsPerPage;

    PageInfo({
        this.totalResults,
        this.resultsPerPage,
    });

    factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
    };
}
