// To parse this JSON data, do
//
//     final allVideo = allVideoFromJson(jsonString);

import 'dart:convert';

AllVideo allVideoFromJson(String str) => AllVideo.fromJson(json.decode(str));

String allVideoToJson(AllVideo data) => json.encode(data.toJson());

class AllVideo {
    final String kind;
    final String etag;
    final String nextPageToken;
    final String? prevPageToken;
    final String regionCode;
    final PageInfo pageInfo;
    final List<Item> items;

    AllVideo({
        required this.kind,
        required this.etag,
        required this.nextPageToken,
        this.prevPageToken,
        required this.regionCode,
        required this.pageInfo,
        required this.items,
    });

    factory AllVideo.fromJson(Map<String, dynamic> json) => AllVideo(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        prevPageToken: json["prevPageToken"],
        regionCode: json["regionCode"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "prevPageToken": prevPageToken,
        "regionCode": regionCode,
        "pageInfo": pageInfo.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    final ItemKind kind;
    final String etag;
    final Id id;
    final Snippet snippet;

    Item({
        required this.kind,
        required this.etag,
        required this.id,
        required this.snippet,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: itemKindValues.map[json["kind"]]!,
        etag: json["etag"],
        id: Id.fromJson(json["id"]),
        snippet: Snippet.fromJson(json["snippet"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": itemKindValues.reverse[kind],
        "etag": etag,
        "id": id.toJson(),
        "snippet": snippet.toJson(),
    };
}

class Id {
    final IdKind kind;
    final String videoId;

    Id({
        required this.kind,
        required this.videoId,
    });

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: idKindValues.map[json["kind"]]!,
        videoId: json["videoId"],
    );

    Map<String, dynamic> toJson() => {
        "kind": idKindValues.reverse[kind],
        "videoId": videoId,
    };
}

enum IdKind {
    YOUTUBE_VIDEO
}

final idKindValues = EnumValues({
    "youtube#video": IdKind.YOUTUBE_VIDEO
});

enum ItemKind {
    YOUTUBE_SEARCH_RESULT
}

final itemKindValues = EnumValues({
    "youtube#searchResult": ItemKind.YOUTUBE_SEARCH_RESULT
});

class Snippet {
    final DateTime publishedAt;
    final ChannelId channelId;
    final String title;
    final String description;
    final Thumbnails thumbnails;
    final ChannelTitle channelTitle;
    final LiveBroadcastContent liveBroadcastContent;
    final DateTime publishTime;

    Snippet({
        required this.publishedAt,
        required this.channelId,
        required this.title,
        required this.description,
        required this.thumbnails,
        required this.channelTitle,
        required this.liveBroadcastContent,
        required this.publishTime,
    });

    factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: channelIdValues.map[json["channelId"]]!,
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: channelTitleValues.map[json["channelTitle"]]!,
        liveBroadcastContent: liveBroadcastContentValues.map[json["liveBroadcastContent"]]!,
        publishTime: DateTime.parse(json["publishTime"]),
    );

    Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelIdValues.reverse[channelId],
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitleValues.reverse[channelTitle],
        "liveBroadcastContent": liveBroadcastContentValues.reverse[liveBroadcastContent],
        "publishTime": publishTime.toIso8601String(),
    };
}

enum ChannelId {
    UC4_ZU_P_UDO_M7_ABR1_T_HE_LE_LAG
}

final channelIdValues = EnumValues({
    "UC4ZuPUdoM7abr1THeLE-Lag": ChannelId.UC4_ZU_P_UDO_M7_ABR1_T_HE_LE_LAG
});

enum ChannelTitle {
    E_N_A_TV
}

final channelTitleValues = EnumValues({
    "eN-A Tv": ChannelTitle.E_N_A_TV
});

enum LiveBroadcastContent {
    NONE
}

final liveBroadcastContentValues = EnumValues({
    "none": LiveBroadcastContent.NONE
});

class Thumbnails {
    final Default thumbnailsDefault;
    final Default medium;
    final Default high;

    Thumbnails({
        required this.thumbnailsDefault,
        required this.medium,
        required this.high,
    });

    factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
    );

    Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
    };
}

class Default {
    final String url;
    final int width;
    final int height;

    Default({
        required this.url,
        required this.width,
        required this.height,
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
    final int totalResults;
    final int resultsPerPage;

    PageInfo({
        required this.totalResults,
        required this.resultsPerPage,
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
