import 'package:get/get.dart';
import 'package:mahaduna_apps/app/modules/transaksi/controllers/transaksi_controller.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class PaymentController extends GetxController {
  final arguments = Get.arguments;
  final transaksiC = Get.find<TransaksiController>();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    transaksiC.refreshPage();
  }

}
