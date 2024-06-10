import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../controllers/addiya_controller.dart';

class AddiyaView extends GetView<AddiyaController> {
  final ScrollController scrollC = ScrollController();
  String dynamicTitle() {
    if ((Get.arguments is Map) && Get.arguments.containsKey('sortBest')) {
      if (Get.arguments['sortBest'] == true) {
        return 'Majalah Terpopuler';
      } else {
        return 'Majalah Terbaru';
      }
    } else {
      return 'Semua Majalah';
    }
  }

  void loadMore() {
    if (scrollC.position.pixels == scrollC.position.maxScrollExtent &&
        (controller.addiyaData.value?.meta?.currentPage ?? 0) <
            (controller.addiyaData.value?.meta?.lastPage ?? 0)) {
      if (!controller.isLoadingLoadMore.value) {
        var page = (controller.addiyaData.value?.meta?.currentPage ?? 0) + 1;
        controller.loadMore(page);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    scrollC.addListener(loadMore);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Majalah Addiya',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Color(ConfigColor.appBarColor1),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isLoadingAddiya.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.addiyaData.value != null &&
              controller.addiyaErr.value == null) {
            return RefreshIndicator(
              onRefresh: () => controller.refreshPage(),
              child: ListView(
                controller: scrollC,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 20),
                          child: Text(
                            '${dynamicTitle()}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        ResponsiveGridList(
                          desiredItemWidth: 150,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          minSpacing: 10,
                          children:
                              controller.addiyaData.value!.data!.map((item) {
                            return InkWell(
                              onTap: () => Get.toNamed(Routes.PDF_VIEWER,
                                  arguments: {'pdf': item.source}),
                              child: Container(
                                height: 270,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(5, 4),
                                    )
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: 190,
                                            width: Get.width,
                                            child: Image.network(
                                              '${item.bannerImage}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${item.judul}',
                                                style: TextStyle(
                                                    height: 1.25,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    if (!controller.isLoadingAddiya.value &&
                        controller.isLoadingLoadMore.value) {
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
              child: Text('Kesalahan Sisten'),
            );
          }
        }));
  }
}
