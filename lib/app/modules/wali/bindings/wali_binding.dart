import 'package:get/get.dart';

import 'package:mahaduna_apps/app/modules/wali/controllers/login_controller.dart';

import '../controllers/wali_controller.dart';

class WaliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<WaliController>(
      () => WaliController(),
    );
  }
}
