import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/modules/kajian/views/_playlist.dart';
import 'package:mahaduna_apps/app/modules/kajian/views/_video_baru.dart';

import '../controllers/kajian_controller.dart';
import '_header.dart';

class KajianView extends GetView<KajianController> {
  final ScrollController scrollCvideoTerbaru = ScrollController();
  final ScrollController scrollCplaylist = ScrollController();
  final index;
  KajianView({this.index = 0});

  void loadMoreVideo() {
    if (scrollCvideoTerbaru.position.pixels ==
            scrollCvideoTerbaru.position.maxScrollExtent &&
        controller.allVideoData.value!.nextPageToken != null) {
      if (!controller.isLoadingMoreVideo.value) {
        if (controller.limitLoadMore.value > 0 &&
            !controller.isLoadingMoreVideo.value) {
          controller
              .loadMoreAllVideo(controller.allVideoData.value!.nextPageToken);
        }
      }
    }
  }

  void loadMorePlaylist() {
    if (scrollCplaylist.position.pixels ==
            scrollCplaylist.position.maxScrollExtent &&
        (controller.playlistData.value?.currentPage ?? 0) <
            (controller.playlistData.value?.lastPage ?? 0)) {
      if (!controller.isLoadingMorePlaylist.value) {
        var page = (controller.playlistData.value?.currentPage ?? 0) + 1;
        controller.loadMorePlaylist(page);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    scrollCvideoTerbaru.addListener(loadMoreVideo);
    scrollCplaylist.addListener(loadMorePlaylist);
    return DefaultTabController(
      length: 2,
      initialIndex: index,
      child: Scaffold(
        appBar:
            PreferredSize(preferredSize: Size.fromHeight(50), child: Header()),
        body: TabBarView(children: [
          RefreshIndicator(
            onRefresh: controller.refreshAllVideo,
            child: ListView(
              controller: scrollCvideoTerbaru,
              children: [
                //btn search
                Obx(
                  () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.searchInput,
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: 'Cari Video',
                              floatingLabelStyle: TextStyle(
                                  color: Color(ConfigColor.appBarColor2)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              prefixIcon: Icon(Icons.search),
                              prefixIconColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      states.contains(MaterialState.focused)
                                          ? Color(ConfigColor.appBarColor2)
                                          : Colors.grey.shade800),
                              suffixIcon: controller.isSearching.value
                                  ? IconButton(
                                      onPressed: () =>
                                          controller.closeSearch(),
                                      icon: Icon(Icons.close))
                                  : null,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    10.0)), // Add border radius here
                                borderSide: BorderSide(
                                  color: Color(ConfigColor.appBarColor2),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15.0),
                            ),
                          ),
                        ),
                        SizedBox(
                            width:
                                10), // Add some spacing between the TextField and button
                        InkWell(
                          onTap: () {
                            controller.onSearchButtonPressed();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: Color(ConfigColor.appBarColor2),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(
                              'Cari',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                //   padding: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       border: Border.all(color: Colors.grey, width: 0.6),
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(Icons.search),
                //       SizedBox(
                //         width: 5,
                //       ),
                //       Text(
                //         'Cari video Disini',
                //         style: TextStyle(fontSize: 16),
                //       )
                //     ],
                //   ),
                // ),
                VideoBaru(),
                Obx(() {
                  if (controller.isLoadingAllVideo.value == false &&
                      controller.isLoadingMoreVideo.value) {
                    return Container(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (controller.limitLoadMore.value == 0) {
                    return Container();
                  } else {
                    return Container();
                  }
                })
              ],
            ),
          ),
          RefreshIndicator(
            onRefresh: controller.refreshPlaylist,
            child: ListView(
              controller: scrollCplaylist,
              children: [
                Playlist(),
                Obx(() {
                  if (controller.isLoadingPlaylist.value == false &&
                      controller.isLoadingMorePlaylist.value) {
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
          ),
        ]),
      ),
    );
  }
}
