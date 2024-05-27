import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

import '../controllers/transaksi_controller.dart';
import '../views/tagihan_view.dart';
import '../views/riwayat_view.dart';
import '../views/menunggu_view.dart';

class TransaksiView extends GetView<TransaksiController> {
  final indexAktif = Get.arguments ?? 0;

  @override
  Widget build(BuildContext context) {
    final widthTabbar = (Get.mediaQuery.size.width - 64) / 3;
    return DefaultTabController(
      length: 3,
      initialIndex: indexAktif,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: AppBar(
            backgroundColor: Color(ConfigColor.appBarColor1).withOpacity(0.2), 
            title: Text(
              'Pembayaran Syariah',
              style: TextStyle(color: Colors.grey[900]),
            ),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 10),
              tabAlignment: TabAlignment.center,
              labelStyle: TextStyle(fontSize: 12),
              indicatorColor: Color(ConfigColor.appBarColor2),
              unselectedLabelColor: Colors.grey[900],
              labelColor: Color(ConfigColor.appBarColor2),
              tabs: [
                Container(
                  constraints: BoxConstraints(minWidth: widthTabbar),
                  child: Tab(
                    icon: Icon(Icons.receipt_long),
                    text: "Tagihan",
                  ),
                ),
                Container(
                  constraints: BoxConstraints(minWidth: widthTabbar),
                  child: Tab(
                    icon: Icon(Icons.hourglass_top),
                    text: "Menunggu Dibayar",
                  ),
                ),
                Container(
                  constraints: BoxConstraints(minWidth: widthTabbar),
                  child: Tab(
                    icon: Icon(Icons.history),
                    text: "Riwayat Pembayaran",
                  ),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TagihanView(),
            MenungguView(),
            RiwayatView(),
          ],
        ),
      ),
    );
  }
}
