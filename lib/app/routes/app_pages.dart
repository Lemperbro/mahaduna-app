import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kajian/bindings/kajian_binding.dart';
import '../modules/kajian/views/kajian_view.dart';
import '../modules/pondok/bindings/pondok_binding.dart';
import '../modules/pondok/views/pondok_view.dart';
import '../modules/wali/bindings/wali_binding.dart';
import '../modules/wali/views/wali_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 1)),
    GetPage(
      name: _Paths.KAJIAN,
      page: () => const KajianView(),
      binding: KajianBinding(),
    ),
    GetPage(
      name: _Paths.WALI,
      page: () => const WaliView(),
      binding: WaliBinding(),
    ),
    GetPage(
      name: _Paths.PONDOK,
      page: () => const PondokView(),
      binding: PondokBinding(),
    ),
  ];
}
