import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/modules/store/controllers/store_controller.dart';

class ProdukDetailView extends GetView<StoreController> {
  final data = (Get.arguments is Map) && Get.arguments.containsKey('data')
      ? Get.arguments['data']
      : null;
  @override
  Widget build(BuildContext context) {
    List<String> image =
        data.image.map<String>((item) => item.image as String).toList();
    int numOfShowImages = image.length < 5 ? image.length : (image.length ~/ 4);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Color(ConfigColor.appBarColor1),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          Container(
            child: GalleryImage(
              showAppBar: false,
              imageUrls: image,
              numOfShowImages: numOfShowImages,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'Rp. ${data.price} ',
              style: TextStyle(
                  fontSize: 18,
                  color: Color(ConfigColor.appBarColor1),
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1),
            child: Text(
              '${data.label}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              'Stok ${data.stock}',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deskripsi',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${data.deskripsi}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => controller.redirectToWa(data.label),
            child: Text(
              'Pesan Sekarang',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Color(ConfigColor.appBarColor1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
