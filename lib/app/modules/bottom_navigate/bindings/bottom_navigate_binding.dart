import 'package:get/get.dart';
import 'package:mahaduna_apps/app/modules/home/controllers/home_controller.dart';
import 'package:mahaduna_apps/app/modules/kajian/controllers/kajian_controller.dart';
import 'package:mahaduna_apps/app/modules/wali/controllers/login_controller.dart';
import 'package:mahaduna_apps/app/modules/wali/controllers/wali_controller.dart';

import '../controllers/bottom_navigate_controller.dart';

class BottomNavigateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<WaliController>(
      () => WaliController(),
    );
    Get.lazyPut<KajianController>(
      () => KajianController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BottomNavigateController>(
      () => BottomNavigateController(),
    );
  }
}
