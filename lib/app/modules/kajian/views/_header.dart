import 'package:flutter/material.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(ConfigColor.appBarColor1),
      title: Text('Video Kajian'),
      bottom: TabBar(
        isScrollable: false,
        indicatorColor: Colors.white,
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
