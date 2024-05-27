import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Store',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Color(ConfigColor.appBarColor1),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.refreshPage(),
          child: ListView(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Pilih Produk',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (controller.isLoadingAllProduk.value) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (controller.allProdukData.value != null &&
                            controller.allProdukErr.value == null) {
                          return ResponsiveGridList(
                            desiredItemWidth: 150,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            minSpacing: 10,
                            children:
                                controller.allProdukData.value!.data!.map((item) {
                              return InkWell(
                                onTap: () => Get.toNamed(Routes.PRODUK_DETAIL,
                                    arguments: {'data': item}),
                                child: Container(
                                  height: 350,
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
                                                '${item.image![0].image}',
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
                                            width: Get.width,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    '${item.label}',
                                                    style: TextStyle(
                                                        height: 1.25,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18),
                                                    maxLines: 3,
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top: 8),
                                                  child: Text(
                                                    'Rp. ${item.price}',
                                                    style: TextStyle(
                                                        color: Colors.grey[700],
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    'Stok ${item.stock}',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    '${DateFormat('EEEE, d MMM yyyy', 'id_ID').format(item.createdAt!)}',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.grey[600]),
                                                  ),
                                                )
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
                          );
                        } else {
                          return Center(
                            child: Text('Kesalahan sistem'),
                          );
                        }
                      })
                    ],
                  ))
            ],
          ),
        ));
  }
}
