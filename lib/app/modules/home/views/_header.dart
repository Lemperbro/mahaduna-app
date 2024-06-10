import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class Header extends StatelessWidget {
  static final heightHeader = 120;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 44, 15, 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Search video kajian
          Expanded(
            child: InkWell(
              onTap: () => Get.offAllNamed(Routes.BOTTOM_NAVIGATE,
                  arguments: {'index': 1, 'kajianTabIndex': 0}),
              child: Container(
                child: TextButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 239, 240, 243)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Icon(Icons.search, size: 25, color: Colors.grey[600]),
                        SizedBox(width: 8),
                        Text(
                          'Cari Video Kajian',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          //Button notif
          InkWell(
            onTap: () => Get.toNamed(Routes.NOTIFIKASI),
            child: Container(
                width: 47,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                      width: 1.0, color: Colors.grey.withOpacity(0.3)),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      right: 14,
                      top: 10,
                      child: Container(
                        width: 8,
                        height: 8,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
