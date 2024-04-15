import 'package:get/get.dart';

import '../controllers/bottom_navigate_controller.dart';

class BottomNavigateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigateController>(
      () => BottomNavigateController(),
    );
  }
}
