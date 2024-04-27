
import 'package:get/get.dart';
import '../views/bottom_navigate_view.dart';

class BottomNavigateController extends GetxController {
  var currentIndex = 0.obs;
  // void changePage(int index) {
  //   currentIndex.value = index;
  //   switch (index) {
  //     case 0:
  //       Get.offAllNamed(Routes.HOME);
  //       break;
  //     case 1:
  //       Get.offAllNamed(Routes.KAJIAN); // Pindahkan ke halaman Kajian
  //       break;
  //     // Tambahkan case untuk setiap halaman lainnya
  //   }
  // }

  void onItemTapped(int index) {
    if (index == currentIndex.value) {
      Get.offAll(() => BottomNavigateView(index: index));
    } else {
      currentIndex.value = index;
    }
  }
}
