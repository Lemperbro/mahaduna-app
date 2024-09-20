import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:mahaduna_apps/app/modules/home/controllers/home_controller.dart';
import 'package:intl/intl.dart';
import 'package:mahaduna_apps/app/partials/feedback.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';


class NewVideo extends GetView<HomeController> {
  final feedBack = FeedBack();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Obx(() {
                if (controller.isLoadingVideoTerbaru.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.videoTerbaruData.value != null &&
                    controller.videoTerbaruErr.value == null &&
                    controller.videoTerbaruData.value != null) {
                  return Row(
                    children:
                        controller.videoTerbaruData.value!.items!.map((item) {
                      return InkWell(
                        onTap: () => Get.toNamed(Routes.PLAY_KAJIAN,
                            arguments: {'videoId': item.id!.videoId}),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(children: [
                                Container(
                                  width: 270,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      '${item.snippet!.thumbnails!.high!.url}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                           
                              ]),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 270,
                                padding: EdgeInsets.only(top: 10),
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
                                      child: Text(
                                          '${item.snippet!.channelTitle}',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 7),
                                      // child: Text('${DateTime.parse(item.snippet.publishTime.toString()).format('l, d M Y',)}',
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
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else if (controller.videoTerbaruData.value == null &&
                    controller.videoTerbaruErr.value == null) {
                  return feedBack.noData(
                      message: 'Tidak tersedia', paddingTop: 15, scroll: false);
                } else {
                  return feedBack.failedGetData(
                      action: controller.videoTerbaruVoid, paddingTop: 15, scroll: false);
                }
              })
            ]),
          ),
        ),
      ],
    );
  }

  Widget Header() {
    return InkWell(
      onTap: () => Get.offAllNamed(Routes.BOTTOM_NAVIGATE,
          arguments: {'index': 1, 'kajianTabIndex': 0}),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.4), // Warna garis
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 3,
                  height: 18,
                  color: Colors.brown[400],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Video Terbaru',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}

class Playlist extends GetView<HomeController> {
  final feedBack = FeedBack();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderPlaylist(),
        Obx(() {
          if (controller.isLoadingAllPlaylist.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.allPlaylistData.value != null &&
              controller.allPlaylistErr.value == null &&
              controller.allPlaylistData.value != null) {
            return Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.allPlaylistData.value!.data!.map((item) {
                    return InkWell(
                      onTap: () =>
                          Get.toNamed(Routes.PLAYLIST_ITEMS, arguments: {
                        'playlistId': item.id,
                        'playlistTitle': item.snippet!.title,
                        'total': item.contentDetails!.itemCount,
                        'banner': item.snippet!.thumbnails!.high!.url
                      }),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 270,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
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
                              width: 270,
                              padding: EdgeInsets.only(top: 10),
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
              ),
            );
          } else if (controller.allPlaylistData.value == null &&
              controller.allPlaylistErr.value == null) {
            return feedBack.noData(message: 'Tidak tersedia', paddingTop: 15, scroll: false);
          } else {
            return feedBack.failedGetData(
                action: controller.allPlaylistVoid, paddingTop: 15, scroll: false);
          }
        })
      ],
    );
  }

// kdd
  Widget HeaderPlaylist() {
    return InkWell(
      onTap: () => Get.offAllNamed(Routes.BOTTOM_NAVIGATE,
          arguments: {'index': 1, 'kajianTabIndex': 1}),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.4), // Warna garis
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 3,
                  height: 18,
                  color: Colors.brown[400],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Playlist Kajian',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
