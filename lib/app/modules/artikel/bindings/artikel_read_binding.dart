import 'package:get/get.dart';
import 'package:mahaduna_apps/app/modules/artikel/controllers/artikel_controller.dart';

import '../controllers/artikel_read_controller.dart';

class ArtikelReadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArtikelController>(
      () => ArtikelController(),
    );
    Get.lazyPut<ArtikelReadController>(
      () => ArtikelReadController(),
    );
  }
}
