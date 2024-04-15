import 'package:get/get.dart';

import '../controllers/wali_controller.dart';

class WaliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaliController>(
      () => WaliController(),
    );
  }
}
