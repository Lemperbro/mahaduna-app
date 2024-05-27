import 'package:get/get.dart';

import 'package:mahaduna_apps/app/modules/transaksi/controllers/payment_controller.dart';

import '../controllers/transaksi_controller.dart';

class TransaksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
    Get.lazyPut<TransaksiController>(
      () => TransaksiController(),
    );
  }
}
