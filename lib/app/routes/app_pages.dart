import 'package:get/get.dart';
import 'package:mahaduna_apps/app/modules/bottom_navigate/bindings/bottom_navigate_binding.dart';
import 'package:mahaduna_apps/app/modules/bottom_navigate/views/bottom_navigate_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kajian/bindings/kajian_binding.dart';
import '../modules/kajian/views/kajian_view.dart';
import '../modules/pondok/bindings/pondok_binding.dart';
import '../modules/pondok/views/pondok_view.dart';
import '../modules/wali/bindings/wali_binding.dart';
import '../modules/wali/views/wali_view.dart';

part 'app_routes.dart';
class auth extends GetMiddleware{

}
class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.BOTTOM_NAVIGATE,
        page: () => BottomNavigateView(),
        binding: BottomNavigateBinding(),
        transition: Transition.fadeIn,
        middlewares: [auth()],
        transitionDuration: Duration(milliseconds: 1)),
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 1)),
    GetPage(
      name: _Paths.KAJIAN,
      page: () => KajianView(),
      binding: KajianBinding(),
    ),
    GetPage(
      name: _Paths.WALI,
      page: () => WaliView(),
      binding: WaliBinding(),
    ),
    GetPage(
      name: _Paths.PONDOK,
      page: () => PondokView(),
      binding: PondokBinding(),
    ),
  ];
}
