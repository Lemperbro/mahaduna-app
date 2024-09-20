import 'package:get/get.dart';

import '../controllers/addiya_controller.dart';

class AddiyaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddiyaController>(
      () => AddiyaController(),
    );
  }
}
