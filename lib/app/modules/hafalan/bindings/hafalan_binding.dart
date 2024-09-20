import 'package:get/get.dart';

import '../controllers/hafalan_controller.dart';

class HafalanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HafalanController>(
      () => HafalanController(),
    );
  }
}
