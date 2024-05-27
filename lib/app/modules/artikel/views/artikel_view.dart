import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/modules/artikel/controllers/artikel_controller.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class ArtikelView extends GetView<ArtikelController> {
  final ScrollController scrollC = ScrollController();

  void loadMore() {
    if (scrollC.position.pixels == scrollC.position.maxScrollExtent &&
        (controller.allArtikelDataTerbaru.value?.meta?.currentPage ?? 0) <
            (controller.allArtikelDataTerbaru.value?.meta?.lastPage ?? 0)) {
      controller.isLoadingLoadMore.value = true;
      var page =
          (controller.allArtikelDataTerbaru.value?.meta?.currentPage ?? 0) + 1;
      if (controller.kategoriIdAktif.value != 0) {
        controller.loadMoreArtikel(page,
            kategori_id: controller.kategoriIdAktif.value.toString());
      } else {
        controller.loadMoreArtikel(page);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    scrollC.addListener(loadMore);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Artikel'),
          backgroundColor: Color(ConfigColor.appBarColor1),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.refreshPage(),
          child: Stack(
            children: [
              Obx(() {
                if (controller.isLoadingAllArtikelTerbaru.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.allArtikelDataTerbaru.value != null &&
                    controller.allArtikelErrTerbaru.value == null) {
                  return ListView(
                    controller: scrollC,
                    padding: EdgeInsets.only(
                        top: 80, left: 15, right: 15, bottom: 20),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.allArtikelDataTerbaru.value!.data!
                            .map(
                              (item) => InkWell(
                                onTap: () => Get.toNamed(Routes.ARTIKEL_READ,
                                    arguments: item),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black.withOpacity(0.2),
                                          width: 1.0),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              '${item.bannerImage}',
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Wrap(
                                                      spacing:
                                                          5, // Jarak antara kategori
                                                      children: item.kategori!
                                                          .map((kategori) {
                                                        return Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 5),
                                                          child: Text(
                                                            '${kategori.kategori}',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  ConfigColor
                                                                      .appBarColor1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .remove_red_eye_outlined,
                                                          size: 18,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 1),
                                                          child: Text(
                                                            '${item.views}',
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 4),
                                                child: Text(
                                                  '${item.judul}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    height: 1.5,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 8),
                                                child: Text(
                                                  '${DateFormat('EEEE, d MMM yyyy', 'id_ID').format(item.createdAt!)}',
                                                  style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Obx(() {
                        if (controller.isLoadingAllArtikelTerbaru.value ==
                                false &&
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
                  );
                } else {
                  return Center(
                    child: Text('Kesalahan Sistem'),
                  );
                }
              }),
              Obx(() {
                if (controller.allKategori.value != null &&
                    controller.allArtikelErrTerbaru.value == null) {
                  return Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 55,
                      color: Colors.grey[200],
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.setActiveMenuArtikel(
                                      'semua', null);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: controller.activeMenuArtikel.value ==
                                            'semua'
                                        ? Color(ConfigColor.appBarColor1)
                                        : null,
                                    border: Border.all(
                                      color: Color(ConfigColor.appBarColor1),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    'Semua',
                                    style: TextStyle(
                                      color:
                                          controller.activeMenuArtikel.value ==
                                                  'semua'
                                              ? Colors.white
                                              : Color(ConfigColor.appBarColor1),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              // List kategori lainnya
                              ...controller.allKategori.value!.data!
                                  .map((item) {
                                return InkWell(
                                  onTap: () {
                                    controller.setActiveMenuArtikel(
                                        item.kategori!.toLowerCase(),
                                        item.kategoriId);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color:
                                          controller.activeMenuArtikel.value ==
                                                  item.kategori!.toLowerCase()
                                              ? Color(ConfigColor.appBarColor1)
                                              : null,
                                      border: Border.all(
                                        color: Color(ConfigColor.appBarColor1),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      '${item.kategori}',
                                      style: TextStyle(
                                        color: controller
                                                    .activeMenuArtikel.value ==
                                                item.kategori!.toLowerCase()
                                            ? Colors.white
                                            : Color(ConfigColor.appBarColor1),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              })
            ],
          ),
        ));
  }
}
