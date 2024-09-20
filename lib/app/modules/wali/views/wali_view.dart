import 'dart:ffi';
import 'dart:ui';

import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/modules/wali/views/login_view.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

import '../controllers/wali_controller.dart';

class WaliView extends GetView<WaliController> {
  @override
  Widget build(BuildContext context) {
    return isAuth(controller);
  }

  Widget isAuth(WaliController controller) {
    if (controller.authKey == null) {
      return LoginView();
    } else {
      return dashboardWali2(controller);
    }
  }

  Widget dashboardWali2(WaliController controller) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard Wali',
        ),
        backgroundColor: Color(ConfigColor.appBarColor1),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refreshPage(),
        child: Obx(() {
          if (controller.waliData.value != null &&
              controller.waliDataErr.value == null) {
            return Stack(
              children: [
                ListView(
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(ConfigColor.appBarColor2),
                                  Color(ConfigColor.appBarColor1),
                                ], // Warna gradient yang Anda inginkan
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            height: 240,
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 60),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Selamat Datang Bapak/Ibu',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[200]),
                                        ),
                                      ),
                                      Container(
                                        width: (Get.width * 0.690),
                                        child: Text(
                                          '${controller.waliData.value!.data!.nama!}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () => Get.toNamed(Routes.WALI_PROFILE),
                                    child: Container(
                                      child: CircleAvatar(
                                        maxRadius: 30,
                                        backgroundImage: AssetImage(
                                            'assets/images/default_pp_user.png'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 180,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 60),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  topLeft: Radius.circular(50),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    'Pembayaran Syariah',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GridView.count(
                                    primary: false,
                                    shrinkWrap: true,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 2,
                                    childAspectRatio: 4 / 3.2,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () => Get.toNamed(
                                            Routes.TRANSAKSI,
                                            arguments: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        color: Color(ConfigColor
                                                                .appBarColor2)
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Icon(
                                                        Icons.receipt_long,
                                                        size: 50,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          bottom: BorderSide(
                                                            color: Color(ConfigColor
                                                                    .appBarColor2)
                                                                .withOpacity(
                                                                    0.7),
                                                            width: 5.0,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        '${controller.countTagihan.value}',
                                                        style: TextStyle(
                                                            fontSize: 32,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                child: Text(
                                                  'Total Jumlah Tagihan',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  softWrap: true,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => Get.toNamed(
                                            Routes.TRANSAKSI,
                                            arguments: 1),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        color: Colors.orange,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Icon(
                                                        Icons.hourglass_top,
                                                        size: 50,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          bottom: BorderSide(
                                                            color:
                                                                Colors.orange,
                                                            width: 5.0,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        '${controller.countMenungguBayar.value}',
                                                        style: TextStyle(
                                                            fontSize: 32,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                child: Text(
                                                  'Menunggu dibayar',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  softWrap: true,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => Get.toNamed(
                                            Routes.TRANSAKSI,
                                            arguments: 2),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colors.deepPurple[600],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Icon(
                                                    Icons.history,
                                                    size: 50,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                child: Text(
                                                  'Riwayat Pembayaran',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  softWrap: true,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.green[700],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Icon(
                                                  Icons.library_books,
                                                  size: 50,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              child: Text(
                                                'Panduan Pembayaran',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                softWrap: true,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40, bottom: 20),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    'Putra/Putri',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: controller
                                      .waliData.value!.data!.santri!
                                      .map(
                                        (item) => InkWell(
                                          onTap: () => Get.toNamed(Routes.SANTRI, arguments: item),
                                          child: Container(
                                            margin:
                                                EdgeInsets.symmetric(vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        child: Text(
                                                          '${item.nama?.toCapitalCase()}',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          softWrap: true,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 6,
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                          color: item.status ==
                                                                  'aktif'
                                                              ? Colors.green
                                                              : Colors.grey[800],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7)),
                                                      child: Text(
                                                        '${item.status?.toCapitalCase()}',
                                                        style: TextStyle(
                                                            color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Container(
                                                  child: Text(
                                                    '${item.jenjang?.toCapitalCase()}',
                                                    style: TextStyle(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                if (controller.isLogout.value)
                  Container(
                    color: Colors.black.withOpacity(0.4),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          } else if (controller.waliDataErr.value != null) {
            print(controller.waliDataErr.value);
            return Center(
              child: Text('Kesalahan Sistem'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      floatingActionButton: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.red),
          iconColor: MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: () => controller.isLogout.value ? null : controller.logout(),
        icon: Icon(Icons.logout),
        label: Text(
          'Keluar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
