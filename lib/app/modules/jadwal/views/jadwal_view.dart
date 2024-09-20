import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

import '../controllers/jadwal_controller.dart';

class JadwalView extends GetView<JadwalController> {
  const JadwalView({Key? key}) : super(key: key);
  DateTime parseTimeString(String timeString) {
    return DateFormat('HH:mm:ss').parse(timeString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Jadwal Santri'),
          backgroundColor: Color(ConfigColor.appBarColor1),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isLoadingJadwal.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.jadwalData.value != null &&
              controller.jadwalErr.value == null) {
            final jamSekarang = controller.timeNow.value;
            controller.cariJadwalSekarang(jamSekarang);
            return RefreshIndicator(
              onRefresh: () => controller.refreshPage(),
              child: ListView(
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: 250),
                    padding: EdgeInsets.only(left: 40, right: 40, top: 25),
                    decoration: BoxDecoration(
                        color: Color(ConfigColor.appBarColor3),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Center(
                                child: Text(
                                  'Sekarang',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'Kegiatan',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                '${controller.jadwalSekarangData.value!.data![0].jadwal != null ? controller.jadwalSekarangData.value!.data![0].jadwal : 'tidak ada'}',
                                style: TextStyle(
                                    color: Colors.grey[300], fontSize: 15),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'Mulai Jam',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '${controller.jadwalSekarangData.value!.data![0].startTime != null ? DateFormat.Hm().format(parseTimeString(controller.jadwalSekarangData.value!.data![0].startTime!)) : 'tidak ada'}',
                                        style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'Selesai Jam',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '${controller.jadwalSekarangData.value!.data![0].endTime != null ? DateFormat.Hm().format(parseTimeString(controller.jadwalSekarangData.value!.data![0].endTime!)) : 'tidak ada'}',
                                        style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 20),
                    child: Text(
                      'Semua Jadwal',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                  Container(
                    // constraints: BoxConstraints(minHeight: 500),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        )),
                    child: DataTable(
                      border:
                          TableBorder(borderRadius: BorderRadius.circular(35)),
                      // ignore: deprecated_member_use
                      dataRowHeight: 65,
                      columnSpacing: 5,
                      columns: [
                        DataColumn(
                          label: Expanded(
                            child: Center(child: Text('Kegiatan')),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Center(child: Text('Jam')),
                          ),
                        ),
                      ],
                      rows: controller.jadwalData.value!.data!
                          .map(
                            (item) => DataRow(
                                color: item.jadwalId! ==
                                        controller.jadwalSekarangData.value!
                                            .data![0].jadwalId
                                    ? MaterialStatePropertyAll(
                                        Color(ConfigColor.appBarColor3))
                                    : MaterialStatePropertyAll(Colors.white),
                                cells: [
                                  DataCell(
                                    Container(
                                      width: 200,
                                      child: Center(
                                          child: Text(
                                        '${item.jadwal}',
                                        style: TextStyle(
                                            color: item.jadwalId! ==
                                                    controller.jadwalSekarangData
                                                        .value!.data![0].jadwalId
                                                ? Colors.white
                                                : Colors.black),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '${DateFormat.Hm().format(parseTimeString(item.startTime!))} - ${DateFormat.Hm().format(parseTimeString(item.endTime!))}',
                                        style: TextStyle(
                                            color: item.jadwalId! ==
                                                    controller.jadwalSekarangData
                                                        .value!.data![0].jadwalId
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                ]),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Text('Kesalahan sistem'),
            );
          }
        }));
  }
}
