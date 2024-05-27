import 'package:flutter/material.dart';
import 'package:mahaduna_apps/app/modules/home/views/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:get/get.dart';


abstract class NavigateRoutes {
  static void navigateToTest(BuildContext context) {
    PersistentNavBarNavigator.pushDynamicScreen(
      context,
      screen: GetPageRoute(
          page: () => HomeView(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 1)),
      withNavBar: true,
    );
  }

  static final Map<String, Function(BuildContext)> navRoutes = {
    'Kajian': navigateToTest,
  };
}
