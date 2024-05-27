import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:flutter_html/flutter_html.dart';

import '../controllers/play_kajian_controller.dart';

class PlayKajianView extends GetView<PlayKajianController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoadingFindVideo.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.findVideoData.value != null) {
          return YoutubePlayerScaffold(
            controller: YoutubePlayerController.fromVideoId(
              videoId: controller.findVideoData.value!.items![0].id.toString(),
              autoPlay: true,
              params: YoutubePlayerParams(showFullscreenButton: true),
            ),
            aspectRatio: 16 / 9,
            builder: (context, player) {
              return Column(
                children: [
                  AppBar(
                    centerTitle: true,
                    title: Text(
                      'Video',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    backgroundColor: Color(ConfigColor.appBarColor1),
                  ),
                  player,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${controller.findVideoData.value!.items![0].snippet!.title}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/logo.png',
                                  width: 45,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${controller.findVideoData.value!.items![0].snippet!.channelTitle}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                )
                              ],
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 17, 0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Subscribe',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${controller.findVideoData.value!.items![0].snippet!.description}',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        } else {
          return Text('asasas');
        }
      }),
    );
  }
}
