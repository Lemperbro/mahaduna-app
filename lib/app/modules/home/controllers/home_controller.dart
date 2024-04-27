import 'package:get/get.dart';
import 'package:mahaduna_apps/app/controllers/kajian_data_controller.dart';


class HomeController extends GetxController {
  final _kajianDataC = Get.put(KajianDataController());
  // final _allVideo = Get.put(AllVideo());
  RxString activeMenuArtikel = 'terbaru'.obs;
  void onInit() {
    _kajianDataC.getAllKajian();
    // _allVideo.getAllLatestVideo();
    super.onInit();
  }

  void setActiveMenuArtikel(String menu) {
    activeMenuArtikel.value = menu;
  }


}
