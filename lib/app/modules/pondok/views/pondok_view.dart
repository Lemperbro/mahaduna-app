import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../controllers/pondok_controller.dart';

class PondokView extends GetView<PondokController> {
  const PondokView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> photoList = [
      'assets/images/pondok.jpg',
      'assets/images/pondok1.jpg',
      'assets/images/pondok2.jpg',
    ];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: [
          Stack(
            children: [
              Positioned(
                child: AppBar(
                  toolbarHeight: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black.withOpacity(0.3),
                    statusBarIconBrightness: Brightness.light,
                    systemNavigationBarColor: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
              Stack(children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.black,
                          insetPadding: EdgeInsets.zero,
                          child: Stack(
                            children: [
                              PhotoViewGallery.builder(
                                scrollPhysics: const BouncingScrollPhysics(),
                                builder: (BuildContext context, int index) {
                                  return PhotoViewGalleryPageOptions(
                                    imageProvider: AssetImage(photoList[index]),
                                  );
                                },
                                itemCount: photoList.length,

                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: Icon(Icons.close, color: Colors.white),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/images/pondok.jpg',
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                    height: 100,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 34),
                    child: Text(
                      "Ma'had Nuur Al-Anwar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]),
              Positioned(
                left: 0,
                right: 0,
                top: 325,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25)),
                  constraints: BoxConstraints(minHeight: 200),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Pondok Nuur al-Anwar adalah lembaga pendidikan Islam yang bertujuan membimbing santrinya menjadi generasi yang cinta membaca, responsif terhadap perubahan zaman, dan memiliki landasan ilmu agama yang mendalam. Mereka diajarkan untuk melangkah dengan tawakkal kepada Allah dan cinta kepada Rasulullah. Pondok ini juga menekankan pentingnya memandang hidup sebagai ibadah kepada Allah semata dan menanamkan jiwa khidmah yang kuat, agar santri-santri selalu siap untuk melayani dan bermanfaat bagi sesama.',
                    style: TextStyle(color: Colors.grey[800]),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    '• Visi',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 2),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "Membimbing santri menjadi generasi masa depan yang cinta membaca, tanggap dengan keadaan, dan sanggup menghadapi zaman dengan modal ilmu agama yang mendalam, disertai rasa tawakkal sepenuhnya kepada Allah ta'ala dan kecintaan kepada Rasulullah dalam melangkah.",
                    style: TextStyle(color: Colors.grey[800]),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    '• Misi',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 2),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "– Membimbing pola pikir santri bahwa kelak segala hidupnya, apapun profesinya, adalah hanya karena Allah semata.",
                    style: TextStyle(color: Colors.grey[800]),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "– Membimbing santri untuk memiliki jiwa khidmah yang kuat dan selalu berguna bagi siapapun.",
                    style: TextStyle(color: Colors.grey[800]),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



