import 'package:flutter/material.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(ConfigColor.appBarColor1),
      centerTitle: true,
      // title: Text('Video Kajian', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
      bottom: TabBar(
        isScrollable: false,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[300],
        indicatorWeight: 3,
        tabs: [
          Tab(
            text: 'Video Terbaru',
          ),
          Tab(
            text: 'Playlist',
          ),
        ],
      ),
    );
  }
}
