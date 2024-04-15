import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/modules/home/views/_artikel.dart';

import '../controllers/home_controller.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import '_header.dart';
import '_menu.dart';
import '_kajian.dart';
import '_addiya.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // bottomNavigationBar: BottomNavigateView(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Header.heightHeader.toDouble()),
        child: Header(),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(ConfigColor.appBarColor1).withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
              gradient: LinearGradient(begin: Alignment.topLeft, colors: [
                Color(ConfigColor.appBarColor1),
                Color(ConfigColor.appBarColor2),
              ]),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              children: [
                Container(
                  height: 60,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Ma'haduNA",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        "PP. Nuur Al-Anwar Parengan",
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //menu
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Menu(),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, top: 15, bottom: 20),
            margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //video baru
                NewVideo(),
                //playlist
                Playlist()
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            margin: EdgeInsets.only(bottom: 10),
            child: AddiyaPopuler(),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 40),
            decoration: BoxDecoration(color: Colors.white),
            child: Artikel(),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 40, left: 15, right: 15),
            child: AddiyaTerbaru(),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
