import 'package:flutter/material.dart';
import 'package:change_case/change_case.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/modules/transaksi/controllers/transaksi_controller.dart';
import 'package:mahaduna_apps/app/partials/feedback.dart';

class TagihanView extends GetView<TransaksiController> {
  final feedBack = FeedBack();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.refreshPage(),
      child: Obx(() {
        if (controller.allTagihanData.value == null ||
            controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.allTagihanData.value != null &&
            controller.allTagihanErr.value == null &&
            controller.allTagihanData.value!.data!.length > 0) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            children: controller.allTagihanData.value!.data!
                .map(
                  (item) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(4, 4),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Text(
                                  '${item.status!.toCapitalCase()}',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Di buat ${DateFormat('d MMM yyyy', 'id_ID').format(item.createdAt!)}',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            '${item.label!.toCapitalCase()}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            'Tagihan Bulan ${DateFormat('MMM yyyy', 'id_ID').format(item.date!)}',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'Nama Santri : ',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            Text(
                              '${item.santri!.nama!.toCapitalCase()}',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Kelas             : ',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            Text(
                              '${item.santri!.jenjang!.jenjang!.toCapitalCase()}',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(
                              '${NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp. ',
                                decimalDigits: 2,
                              ).format(item.price!)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Color(ConfigColor.appBarColor1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () =>
                              controller.createPayment(item.tagihanId!),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Color(ConfigColor.appBarColor1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Bayar Sekarang',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        } else if (controller.allTagihanErr.value != null) {
          return feedBack.failedGetData(action: controller.failedGetRefresh);
        } else if (controller.allTagihanData.value!.data!.length <= 0) {
          return feedBack.noData(message: 'Tidak ada tagihan');
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
