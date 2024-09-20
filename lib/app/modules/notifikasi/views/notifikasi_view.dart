import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  const NotifikasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text(
            'Notifikasi',
            style: TextStyle(color: Color(ConfigColor.appBarColor1)),
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.orange.shade100.withOpacity(0.2),
                border: Border(
                  bottom: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 1.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Artikel',
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Ut eum sint nihil et corrupti aliquid consequuntur assumenda.',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(ConfigColor.appBarColor1),
                          fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Text(
                            '07-06-2024 14:00',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade600),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.orange.shade100.withOpacity(0.2),
                border: Border(
                  bottom: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 1.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Artikel',
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Ut eum sint nihil et corrupti aliquid consequuntur assumenda.',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(ConfigColor.appBarColor1),
                          fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Text(
                            '07-06-2024 14:00',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade600),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
