
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:mahaduna_apps/app/modules/kajian/controllers/kajian_controller.dart';
import 'package:mahaduna_apps/app/partials/feedback.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class Playlist extends GetView<KajianController> {
  final feedBack = FeedBack();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingPlaylist.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.playlistData.value != null &&
          controller.playlistErr.value == null) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: controller.playlistData.value!.data!.map((item) {
              return InkWell(
                overlayColor:
                    MaterialStatePropertyAll(Colors.red.withOpacity(0)),
                onTap: () => Get.toNamed(Routes.PLAYLIST_ITEMS, arguments: {
                  'playlistId': item.id,
                  'playlistTitle': item.snippet!.title,
                  'total': item.contentDetails!.itemCount,
                  'banner': item.snippet!.thumbnails!.high!.url
                }),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(4, 4),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: Get.width,
                            height: 202,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              child: Image.network(
                                '${item.snippet!.thumbnails!.high!.url}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.playlist_play_rounded,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(bottom: 4),
                                        child: Text(
                                            '${item.contentDetails!.itemCount}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11),
                                            textAlign: TextAlign.center),
                                      )
                                    ]),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "${HtmlUnescape().convert(item.snippet!.title.toString())}",
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
                              child: Text('${item.snippet!.channelTitle}',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w600)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      } else if (controller.playlistData.value == null &&
          controller.playlistErr.value == null) {
        return feedBack.noData(
          message: 'Tidak tersedia',
        );
      } else {
        return feedBack.failedGetData(
          action: controller.refreshPage,
        );
      }
    });
  }
}
