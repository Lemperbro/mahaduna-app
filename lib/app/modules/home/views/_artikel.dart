import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/modules/home/controllers/home_controller.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class ArtikelPopuler extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(controller),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Artikels(controller),
        )
      ],
    );
  }

  Widget Header(HomeController controller) {
    return Column(
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            margin: EdgeInsets.only(bottom: 10),
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
                      'Artikel Populer',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
        ),
      ],
    );
  }

  Widget Artikels(HomeController controller) {
    return Obx(() {
      if (controller.isLoadingAllArtikelBest.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.allArtikelDataBest.value != null &&
          controller.allArtikelErrBest.value == null) {
        return Column(
          children: controller.allArtikelDataBest.value!.data!.map((item) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 1.0),
                ),
              ),
              child: InkWell(
                onTap: () => Get.toNamed(Routes.ARTIKEL_READ, arguments: item),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Wrap(
                                    spacing: 5, // Jarak antara kategori
                                    children: item.kategori!.map((kategori) {
                                      return Container(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Text(
                                          '${kategori.kategori}',
                                          style: TextStyle(
                                            color:
                                                Color(ConfigColor.appBarColor1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye_outlined,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 1),
                                        child: Text(
                                          '${item.views}',
                                          style: TextStyle(fontSize: 14),
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
                                style:
                                    TextStyle(color: Colors.black, height: 1.5),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Text(
                                '${DateFormat('EEEE, d MMM yyyy', 'id_ID').format(item.createdAt!)}',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        );
      } else {
        return Center(
          child: Text('Kesalahan sistem'),
        );
      }
    });
  }
}

class ArtikelTerbaru extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(controller),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Artikels(controller),
        )
      ],
    );
  }

  Widget Header(HomeController controller) {
    return Column(
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            margin: EdgeInsets.only(bottom: 10),
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
                      'Artikel Terbaru',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
        ),
      ],
    );
  }

  Widget Artikels(HomeController controller) {
    return Obx(() {
      if (controller.isLoadingAllArtikelTerbaru.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.allArtikelDataTerbaru.value != null &&
          controller.allArtikelErrBest.value == null) {
        return Column(
          children: controller.allArtikelDataTerbaru.value!.data!.map((item) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 1.0),
                ),
              ),
              child: InkWell(
                onTap: () => Get.toNamed(Routes.ARTIKEL_READ, arguments: item),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Wrap(
                                    spacing: 5, // Jarak antara kategori
                                    children: item.kategori!.map((kategori) {
                                      return Container(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Text(
                                          '${kategori.kategori}',
                                          style: TextStyle(
                                            color:
                                                Color(ConfigColor.appBarColor1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye_outlined,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 1),
                                        child: Text(
                                          '${item.views}',
                                          style: TextStyle(fontSize: 14),
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
                                style:
                                    TextStyle(color: Colors.black, height: 1.5),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Text(
                                '${DateFormat('EEEE, d MMM yyyy', 'id_ID').format(item.createdAt!)}',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        );
      } else {
        return Center(
          child: Text('Kesalahan sistem'),
        );
      }
    });
  }
}
