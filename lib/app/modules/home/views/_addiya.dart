import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:mahaduna_apps/app/modules/home/controllers/home_controller.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AddiyaPopuler extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Obx(() {
          if (controller.isLoadingAddiyaPopular.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.addiyaPopularData.value != null &&
              controller.addiyaPopularErr.value == null) {
            return Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      viewportFraction: 0.6,
                      height: 340.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4)),
                  items: controller.addiyaPopularData.value!.data!
                      .map(
                        (item) => Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () => Get.toNamed(Routes.PDF_VIEWER,
                                  arguments: {'pdf': item.source}),
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        '${item.bannerImage}',
                                        fit: BoxFit.cover,
                                        height: 340,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ],
            );
          } else {
            return Center(
              child: Text('Kesalahan sistem'),
            );
          }
        })
      ],
    );
  }

  //
  Widget Header() {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ADDIYA, arguments: {'sortBest': true}),
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
                  'Addiya Populer',
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

class AddiyaTerbaru extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        SizedBox(
          height: 10,
        ),
        Obx(() {
          if (controller.isLoadingAddiyaTerbaru.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.addiyaTerbaruData.value != null &&
              controller.addiyaTerbaruErr.value == null) {
            return ResponsiveGridList(
              desiredItemWidth: 150,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              minSpacing: 10,
              children: controller.addiyaTerbaruData.value!.data!.map((item) {
                return InkWell(
                  onTap: () => Get.toNamed(Routes.PDF_VIEWER,
                      arguments: {'pdf': item.source}),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 248,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        '${item.bannerImage}',
                        fit: BoxFit.cover,
                      ),
                      // child: Image.asset(
                      //   'assets/images/cover.png',
                      //   fit: BoxFit.cover,
                      // ),
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
        })
      ],
    );
  }

  Widget Header() {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ADDIYA, arguments: {'sortBest': false}),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
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
                  'Addiya Terbaru',
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
