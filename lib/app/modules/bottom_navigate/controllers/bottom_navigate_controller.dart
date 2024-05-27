import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/app/modules/home/controllers/home_controller.dart';
import 'package:mahaduna_apps/app/modules/kajian/controllers/kajian_controller.dart';
import 'package:mahaduna_apps/app/modules/wali/controllers/login_controller.dart';

class BottomNavigateController extends GetxController {
  var currentIndex = 0.obs;
  final arguments = Get.arguments;
  final homeC = Get.find<HomeController>();
  final kajianC = Get.find<KajianController>();
  GetStorage authKey = GetStorage('wali');

  @override
  void onInit() {
    super.onInit();
  }

  void refreshPage(int index) {
    switch (index) {
      case 0:
        homeC.refreshPage();
        break;
      case 1:
        kajianC.refreshPage();
        break;
    }
  }

  void tappedPageWali(int index) {
    final authKey = this.authKey.read('authKey');
    if (index != 2 && currentIndex == 2) {
      if (authKey == null) {
        Get.delete<LoginController>();
      }
    } else {
      if (authKey == null) {
        Get.put(LoginController());
      }
    }
  }

  void onItemTapped(int index) {
    if (index == currentIndex.value) {
      refreshPage(index);
    } else {
      currentIndex.value = index;
    }
  }
}
