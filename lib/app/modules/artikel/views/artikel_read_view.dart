import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../controllers/artikel_read_controller.dart';

class ArtikelReadView extends GetView<ArtikelReadController> {
  const ArtikelReadView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(controller.arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Baca Artikel',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      '${controller.arguments.bannerImage}',
                      height: 200,
                      width: Get.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: controller.arguments.kategori
                        .map<Widget>(
                          (item) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Color(ConfigColor.appBarColor1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              '${item.kategori}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    '${controller.arguments.judul}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    '${DateFormat('EEEE, d MMM yyyy', 'id_ID').format(controller.arguments.createdAt)}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                HtmlWidget('''${controller.arguments.isi}'''),
              ],
            ),
          )
        ],
      ),
    );
  }
}
