import 'package:get/get.dart';

import '../controllers/santri_controller.dart';

class SantriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SantriController>(
      () => SantriController(),
    );
  }
}
