import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/partials/feedback.dart';

import '../controllers/hafalan_controller.dart';

class HafalanView extends GetView<HafalanController> {
  final feedBack = FeedBack();
  final ScrollController scrollC = ScrollController();
  void loadMore() {
    if (scrollC.position.pixels == scrollC.position.maxScrollExtent &&
        (controller.hafalanData.value?.meta?.currentPage ?? 0) <
            (controller.hafalanData.value?.meta?.lastPage ?? 0)) {
      if (!controller.isLoadingLoadMore.value) {
        var page = (controller.hafalanData.value?.meta?.currentPage ?? 0) + 1;
        controller.loadMore(page);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    scrollC.addListener(loadMore);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Hafalan'),
        backgroundColor: Color(ConfigColor.appBarColor1),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refreshPage(),
        child: ListView(
          controller: scrollC,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Progress Hafalan",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    'Laporan progress hafalan santri per bulan',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                )
              ],
            ),
            Obx(() {
              if (controller.isLoadingHafalan.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.hafalanData.value != null &&
                  controller.dataError.value == null &&
                  controller.hafalanData.value!.data!.length > 0) {
                return Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.hafalanData.value!.data!
                        .map(
                          (bulan) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  '${DateFormat('MMMM yyyy', 'id_ID').format(bulan[0].bulan!)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                              Column(
                                children: bulan
                                    .map(
                                      (item) => Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 15),
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          '${item.progres}',
                                          style: TextStyle(
                                              color: Colors.grey.shade700),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            ],
                          ),
                        )
                        .toList(),
                  ),
                );
              } else if (controller.dataError.value != null) {
                return feedBack.failedGetData(action: controller.allHafalan);
              } else if (controller.hafalanData.value!.data!.length <= 0) {
                return feedBack.noData(message: 'Tidak ada Data');
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
            Obx(() {
              if (controller.isLoadingHafalan.value == false &&
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
      ),
    );
  }
}
