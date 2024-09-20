import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/partials/feedback.dart';

import '../controllers/monitoring_controller.dart';

class MonitoringView extends GetView<MonitoringController> {
  @override
  Widget build(BuildContext context) {
    final kategori =
        controller.kategori == 'sholat jamaah' ? "Sholat Jama'ah" : 'Ngaji';
    final keyJam =
        controller.kategori == 'sholat jamaah' ? "Terlambat" : 'Total';
    final feedBack = FeedBack();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Monitoring ${kategori}"),
        backgroundColor: Color(ConfigColor.appBarColor1),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refreshPage(),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Absen ${kategori}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    'Laporan absen sholat ${kategori} per minggu',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                )
              ],
            ),
            Obx(() {
              if (controller.isLoadingMonitoring.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.monitoringData.value != null &&
                  controller.monitoringError.value == null &&
                  controller.monitoringData.value!.data!.length > 0) {
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: List.generate(
                      controller.monitoringData.value!.data!.length,
                      (index) {
                        final item =
                            controller.monitoringData.value!.data![index];
                        final reversedIndex =
                            controller.monitoringData.value!.data!.length -
                                index;
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Minggu ke-$reversedIndex', // Nomor minggu terbalik
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text('Tidak Hadir'),
                                            Text(
                                                '${item.tidakHadir}'), // Mengakses item.tidakHadir
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('${keyJam}'),
                                            Text(
                                                '${item.terlambat} ${keyJam == 'Total' ? 'Jam' : ''}'), // Mengakses item.terlambat
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                );
              } else if (controller.monitoringError.value != null) {
                return feedBack.failedGetData(action: controller.failedRefresh);
              } else if (controller.monitoringData.value!.data!.length <= 0) {
                return feedBack.noData(message: 'Tidak ada Data');
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}



// 
