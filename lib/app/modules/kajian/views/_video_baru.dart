import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';
import 'package:mahaduna_apps/app/modules/kajian/controllers/kajian_controller.dart';
import 'package:mahaduna_apps/app/partials/feedback.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class VideoBaru extends GetView<KajianController> {
  final feedBack = FeedBack();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingAllVideo.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.allVideoData.value != null &&
          controller.allVideoErr.value == null) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: controller.allVideoData.value!.items!.map((item) {
              return InkWell(
                onTap: () => Get.toNamed(
                  Routes.PLAY_KAJIAN,
                  arguments: {'videoId': item.id!.videoId},
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
        );
      } else if (controller.allVideoData.value == null &&
          controller.allVideoErr.value == null) {
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
