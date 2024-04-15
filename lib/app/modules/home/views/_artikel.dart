import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import '../controllers/artikel_controller.dart';

class Artikel extends StatelessWidget {
  final ArtikelController artikelController = Get.put(ArtikelController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Artikels(),
        )
      ],
    );
  }

  Widget Header() {
    return Obx(
      () => Column(
        children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.4), // Warna garis
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 3,
                        height: 18,
                        color: Colors.brown[400],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Artikel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 28,
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              // color: Colors.grey[100],
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                children: [
                  'Terbaru',
                  'Sejarah Islam',
                  'Aqidah dan Akhlak',
                  'Fiqh dan Ibadah',
                  'Al-Quran dan Tafsir',
                  'Hadis dan Sunnah',
                  'Keluarga dan Perkawinan',
                  'Dakwah dan Tarbiyah',
                  'Ekonomi Islam',
                  'Pendidikan Islam',
                  'Kesehatan dan Kesejahteraan'
                ].map((i) {
                  return InkWell(
                    onTap: () {
                      artikelController.setActiveMenu(i.toLowerCase());
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: artikelController.activeMenu.value ==
                                i.toLowerCase()
                            ? Color(ConfigColor.appBarColor1)
                            : null,
                        border: Border.all(
                            color: Color(ConfigColor.appBarColor1), width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${i}',
                        style: TextStyle(
                          color: artikelController.activeMenu.value ==
                                  i.toLowerCase()
                              ? Colors.white
                              : Color(ConfigColor.appBarColor1),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Artikels() {
    return Column(
      children: [1, 2, 3, 4, 5].map((i) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
            ),
          ),
          child: InkWell(
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://picsum.photos/id/${i}/200/300',
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Terbaru',
                                style: TextStyle(
                                  color: Color(ConfigColor.appBarColor1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(bottom: 1),
                                        child: Text('20', style: TextStyle(fontSize: 14),),)
                                  ]),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: TextStyle(color: Colors.black, height: 1.5),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            'Selasa, 09 April 2024',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
