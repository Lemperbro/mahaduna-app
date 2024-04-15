import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/modules/pondok/views/pondok_view.dart';
import 'package:mahaduna_apps/app/modules/wali/views/wali_view.dart';

import '../controllers/bottom_navigate_controller.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../home/views/home_view.dart';
import '../../kajian/views/kajian_view.dart';

class BottomNavigateView extends GetView<BottomNavigateController> {
  final dynamic home;
  final dynamic kajian;
  final dynamic wali;
  final dynamic pondok;

  BottomNavigateView({
    this.home = null,
    this.kajian = null,
    this.wali = null,
    this.pondok = null,
  });

  List<Widget> _buildScreens() {
    return [
      home ?? HomeView(),
      kajian ?? KajianView(),
      wali ?? WaliView(),
      pondok ?? PondokView()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        title: 'Beranda',
        icon: Icon(
          Icons.space_dashboard_rounded,
          size: 30,
        ),
        activeColorPrimary: Color(ConfigColor.appBarColor1),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        title: 'Kajian',
        icon: Icon(
          Icons.play_circle_rounded,
          size: 30,
        ),
        activeColorPrimary: Color(ConfigColor.appBarColor1),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        title: 'Wali Santri',
        icon: Icon(
          Icons.escalator_warning_rounded,
          size: 30,
        ),
        activeColorPrimary: Color(ConfigColor.appBarColor1),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        title: "Ma'had",
        icon: Icon(
          Icons.apartment_rounded,
          size: 30,
        ),
        activeColorPrimary: Color(ConfigColor.appBarColor1),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      navBarHeight: 60,
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 100),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );

    //old bottom bar
    // final BottomNavigateController controller =
    //     Get.put(BottomNavigateController());
    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 5),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     boxShadow: [
    //       BoxShadow(
    //           color: Colors.grey.withOpacity(0.5),
    //           spreadRadius: 1,
    //           blurRadius: 10,
    //           offset: const Offset(0, 0))
    //     ],
    //   ),
    //   child: ClipRRect(
    //     clipBehavior: Clip.antiAliasWithSaveLayer,
    //     child: BottomNavigationBar(
    //       type: BottomNavigationBarType.fixed,
    //       backgroundColor: Colors.white,
    //       unselectedFontSize: 13,
    //       selectedFontSize: 13,
    //       selectedItemColor: Color(ConfigColor.appBarColor3),
    //       currentIndex: controller.currentIndex
    //           .value, // Tambahkan ini jika Anda menggunakan GetX untuk mengelola state
    //       onTap: controller.changePage,
    //       unselectedItemColor: Color(ConfigColor.appBarColor3).withOpacity(0.5),
    //       items: <BottomNavigationBarItem>[
    //         BottomNavigationBarItem(
    //           label: 'Beranda',
    //           icon: Icon(
    //             Icons.space_dashboard_rounded,
    //             size: 30,
    //           ),
    //         ),
    //         BottomNavigationBarItem(
    //             label: 'Kajian',
    //             icon: Icon(
    //               Icons.play_circle_rounded,
    //               size: 30,
    //             )),
    //         BottomNavigationBarItem(
    //             label: 'Wali Santri',
    //             icon: Icon(
    //               Icons.escalator_warning_rounded,
    //               size: 30,
    //             )),
    //         BottomNavigationBarItem(
    //             label: "Ma'had",
    //             icon: Icon(
    //               Icons.apartment_rounded,
    //               size: 30,
    //             )),
    //       ],
    //     ),
    //   ),
    // );
  }
}
