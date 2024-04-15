import 'package:get/get.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class BottomNavigateController extends GetxController {
  var currentIndex = 0.obs;
  void changePage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed(Routes.HOME); 
        break;
      case 1:
        Get.offAllNamed(Routes.KAJIAN); // Pindahkan ke halaman Kajian
        break;
      // Tambahkan case untuk setiap halaman lainnya
    }
  }
}
