// To parse this JSON data, do
//
//     final playlistItemsModel = playlistItemsModelFromJson(jsonString);

import 'dart:convert';

PlaylistItemsModel playlistItemsModelFromJson(String str) =>
    PlaylistItemsModel.fromJson(json.decode(str));

String playlistItemsModelToJson(PlaylistItemsModel data) =>
    json.encode(data.toJson());

class PlaylistItemsModel {
  final String? kind;
  final String? etag;
  final String? nextPageToken;
  final List<Item>? items;
  final PageInfo? pageInfo;

  PlaylistItemsModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.items,
    this.pageInfo,
  });

  factory PlaylistItemsModel.fromJson(Map<String, dynamic> json) => PlaylistItemsModel(
    kind: json["kind"],
    etag: json["etag"],
    nextPageToken: json["nextPageToken"],
    items: json["items"] == null
        ? []
        : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "nextPageToken": nextPageToken,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "pageInfo": pageInfo?.toJson(),
  };
}

class Item {
  final ItemKind? kind;
  final String? etag;
  final String? id;
  final Snippet? snippet;

  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: json["kind"] == null ? null : itemKindValues.map[json["kind"]],
    etag: json["etag"],
    id: json["id"],
    snippet: json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : itemKindValues.reverse[kind],
    "etag": etag,
    "id": id,
    "snippet": snippet?.toJson(),
  };
}

enum ItemKind { YOUTUBE_PLAYLIST_ITEM }

final itemKindValues = EnumValues({
  "youtube#playlistItem": ItemKind.YOUTUBE_PLAYLIST_ITEM,
});

class Snippet {
  final DateTime? publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final Thumbnails? thumbnails;
  final String? channelTitle;
  final String? playlistId;
  final int? position;
  final ResourceId? resourceId;
  final String? videoOwnerChannelTitle;
  final String? videoOwnerChannelId;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.position,
    this.resourceId,
    this.videoOwnerChannelTitle,
    this.videoOwnerChannelId,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    channelId: json["channelId"],
    title: json["title"],
    description: json["description"],
    thumbnails: json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"],
    playlistId: json["playlistId"],
    position: json["position"],
    resourceId: json["resourceId"] == null ? null : ResourceId.fromJson(json["resourceId"]),
    videoOwnerChannelTitle: json["videoOwnerChannelTitle"],
    videoOwnerChannelId: json["videoOwnerChannelId"],
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt?.toIso8601String(),
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails?.toJson(),
    "channelTitle": channelTitle,
    "playlistId": playlistId,
    "position": position,
    "resourceId": resourceId?.toJson(),
    "videoOwnerChannelTitle": videoOwnerChannelTitle,
    "videoOwnerChannelId": videoOwnerChannelId,
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

class ResourceId {
  final ResourceIdKind? kind;
  final String? videoId;

  ResourceId({
    this.kind,
    this.videoId,
  });

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
    kind: json["kind"] == null ? null : resourceIdKindValues.map[json["kind"]],
    videoId: json["videoId"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : resourceIdKindValues.reverse[kind],
    "videoId": videoId,
  };
}

enum ResourceIdKind { YOUTUBE_VIDEO }

final resourceIdKindValues = EnumValues({
  "youtube#video": ResourceIdKind.YOUTUBE_VIDEO,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

