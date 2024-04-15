import 'package:get/get.dart';
class ArtikelController extends GetxController {
  RxString activeMenu = 'terbaru'.obs;

  void setActiveMenu(String menu) {
    activeMenu.value = menu;
  }
}