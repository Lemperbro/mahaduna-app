import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

import '../controllers/playlist_items_controller.dart';

class PlaylistItemsView extends GetView<PlaylistItemsController> {
  final playlistTitle = Get.arguments['playlistTitle'] ?? 'playlist';
  final totalVideo = Get.arguments['total'] ?? 0;
  final bannerImage = Get.arguments['banner'] ??
      'https://i.ytimg.com/vi/YucLIwlxSkw/hqdefault.jpg';

  final ScrollController scrollC = ScrollController();

  void loadMore() {
    if (scrollC.position.pixels == scrollC.position.maxScrollExtent &&
        controller.playlistItemsData.value!.nextPageToken != null) {
      controller
          .loadMoreItems(controller.playlistItemsData.value!.nextPageToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    scrollC.addListener(loadMore);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Playlist',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Color(ConfigColor.appBarColor1),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isloadingPlaylistItems.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.playlistItemsData.value != null &&
              controller.playlistItemErr.value == null) {
            return RefreshIndicator(
              onRefresh: controller.refreshPage,
              child: ListView(
                controller: scrollC,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 40),
                    decoration:
                        BoxDecoration(color: Color(ConfigColor.appBarColor3)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: Get.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                bannerImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              '${playlistTitle}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'eN-A TV',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '${totalVideo} Video',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.playlistItemsData.value!.items!
                          .map((item) {
                        return InkWell(
                          onTap: () => Get.toNamed(Routes.PLAY_KAJIAN,
                              arguments: {
                                'videoId': item.snippet!.resourceId!.videoId
                              }),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black.withOpacity(0.4),
                                        width: 0.5))),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 165,
                                      height: 93,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          '${item.snippet!.thumbnails!.high!.url}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "${item.snippet!.title}",
                                            style: TextStyle(
                                                height: 1.5,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                            softWrap: true,
                                            maxLines: null,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(
                                              '${item.snippet!.channelTitle}',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 7),
                                          child: Text(
                                              '${DateFormat('EEEE, d MMM yyyy', 'id_ID').format(item.snippet!.publishedAt!)}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Obx(() {
                    if (controller.isloadingPlaylistItems.value == false &&
                        controller.isLoadingLoadmore.value) {
                      return Container(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  })
                ],
              ),
            );
          } else {
            return Center(
              child: Text('Kesalahan sistem'),
            );
          }
        }));
  }
}
