import 'dart:convert';

AllVideo allVideoFromJson(String str) => AllVideo.fromJson(json.decode(str));

String allVideoToJson(AllVideo data) => json.encode(data.toJson());

class AllVideo {
    final String? kind;
    final String? etag;
    final String? nextPageToken;
    final String? prevPageToken;
    final String? regionCode;
    final PageInfo? pageInfo;
    final List<Item>? items;

    AllVideo({
        this.kind,
        this.etag,
        this.nextPageToken,
        this.prevPageToken,
        this.regionCode,
        this.pageInfo,
        this.items,
    });

    factory AllVideo.fromJson(Map<String, dynamic> json) => AllVideo(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        prevPageToken: json["prevPageToken"],
        regionCode: json["regionCode"],
        pageInfo: PageInfo?.fromJson(json["pageInfo"]),
        items: json["items"] != null ? List<Item>.from(json["items"].map((x) => Item.fromJson(x))) : null,
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "prevPageToken": prevPageToken,
        "regionCode": regionCode,
        "pageInfo": pageInfo?.toJson(),
        "items": items != null ? List<dynamic>.from(items!.map((x) => x.toJson())) : null,
    };
}

class Item {
    final ItemKind? kind;
    final String? etag;
    final Id? id;
    final Snippet? snippet;

    Item({
        this.kind,
        this.etag,
        this.id,
        this.snippet,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: itemKindValues.map[json["kind"]],
        etag: json["etag"],
        id: json["id"] != null ? Id.fromJson(json["id"]) : null,
        snippet: json["snippet"] != null ? Snippet.fromJson(json["snippet"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "kind": kind != null ? itemKindValues.reverse[kind!] : null,
        "etag": etag,
        "id": id?.toJson(),
        "snippet": snippet?.toJson(),
    };
}

class Id {
    final IdKind? kind;
    final String? videoId;

    Id({
        this.kind,
        this.videoId,
    });

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: idKindValues.map[json["kind"]],
        videoId: json["videoId"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind != null ? idKindValues.reverse[kind!] : null,
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
    final DateTime? publishedAt;
    final String? channelId;
    final String? title;
    final String? description;
    final Thumbnails? thumbnails;
    final String? channelTitle;
    final LiveBroadcastContent? liveBroadcastContent;
    final DateTime? publishTime;

    Snippet({
        this.publishedAt,
        this.channelId,
        this.title,
        this.description,
        this.thumbnails,
        this.channelTitle,
        this.liveBroadcastContent,
        this.publishTime,
    });

    factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"] != null ? DateTime.parse(json["publishedAt"]) : null,
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"] != null ? Thumbnails.fromJson(json["thumbnails"]) : null,
        channelTitle: json["channelTitle"],
        liveBroadcastContent: json["liveBroadcastContent"] != null ? liveBroadcastContentValues.map[json["liveBroadcastContent"]] : null,
        publishTime: json["publishTime"] != null ? DateTime.parse(json["publishTime"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails?.toJson(),
        "channelTitle": channelTitle,
        "liveBroadcastContent": liveBroadcastContent != null ? liveBroadcastContentValues.reverse[liveBroadcastContent!] : null,
        "publishTime": publishTime?.toIso8601String(),
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
    final Default? thumbnailsDefault;
    final Default? medium;
    final Default? high;

    Thumbnails({
        this.thumbnailsDefault,
        this.medium,
        this.high,
    });

    factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: json["default"] != null ? Default.fromJson(json["default"]) : null,
        medium: json["medium"] != null ? Default.fromJson(json["medium"]) : null,
        high: json["high"] != null ? Default.fromJson(json["high"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault?.toJson(),
        "medium": medium?.toJson(),
        "high": high?.toJson(),
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
