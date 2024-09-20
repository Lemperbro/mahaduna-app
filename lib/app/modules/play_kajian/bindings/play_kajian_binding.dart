import 'package:get/get.dart';

import '../controllers/play_kajian_controller.dart';

class PlayKajianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayKajianController>(
      () => PlayKajianController(),
    );
  }
}
