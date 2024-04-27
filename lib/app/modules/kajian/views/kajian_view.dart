import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/modules/kajian/views/_video_baru.dart';

import '../controllers/kajian_controller.dart';
import '_header.dart';

class KajianView extends GetView<KajianController> {
  KajianView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar:
            PreferredSize(preferredSize: Size.fromHeight(95), child: Header()),
        body: TabBarView(children: [
          ListView(
            children: [
              //btn search
              InkWell(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey, width: 0.6),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Cari video Disini',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              VideoBaru()
            ],
          ),
          ListView(
            children: [Text('hmm')],
          ),
        ]),
      ),
    );
  }
}
