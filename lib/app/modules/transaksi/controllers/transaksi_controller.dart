import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/app/models/tagihan/create_tagihan_models.dart';
import 'package:mahaduna_apps/app/models/tagihan/tagihan_from_santri_model.dart';
import 'package:mahaduna_apps/app/modules/wali/controllers/wali_controller.dart';
import 'package:mahaduna_apps/app/partials/dialog_custom.dart';
import 'package:mahaduna_apps/app/repositori/tagihan_repositori.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class TransaksiController extends GetxController {
  GetStorage getStorage = GetStorage('wali');
  late final authKey = getStorage.read('authKey');
  final waliC = Get.put(WaliController());
  final dialogCustom = DialogCustom();

  final tagihanRepo = Get.put(TagihanRepo());

  final allTagihanData = Rx<AllTagihanSantriModel?>(null);
  final allTagihanErr = Rx<Map<String, dynamic>?>(null);

  final menungguData = Rx<AllTagihanSantriModel?>(null);
  final menungguErr = Rx<Map<String, dynamic>?>(null);

  final riwayatData = Rx<AllTagihanSantriModel?>(null);
  final riwayatErr = Rx<Map<String, dynamic>?>(null);

  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    tagihanVoid();
    menungguDibayarVoid();
    riwayatBayarVoid();
  }

  @override
  void onClose() {
    super.onClose();
    waliC.refreshPage();
  }

  Future refreshPage() async {
    allTagihanData.value = null;
    menungguData.value = null;
    riwayatData.value = null;

    tagihanVoid();
    menungguDibayarVoid();
    riwayatBayarVoid();
  }

  void failedGetRefresh() {
    allTagihanData.value = null;
    menungguData.value = null;
    riwayatData.value = null;
    tagihanVoid();
    menungguDibayarVoid();
    riwayatBayarVoid();
  }

  void tagihanVoid() async {
    try {
      if (authKey != null) {
        var get = await tagihanRepo.allTagihanTagihanFromSantri(this.authKey,
            status: 'belum dibayar');
        if (get is Map) {
          if (get.containsKey('error')) {
            allTagihanErr.value = {'error': true};
          }
        } else {
          allTagihanData.value = get;
        }
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    }
  }

  void menungguDibayarVoid() async {
    try {
      if (authKey != null) {
        var get = await tagihanRepo.allTagihanTagihanFromSantri(this.authKey,
            status: 'menunggu dibayar');
        if (get is Map) {
          if (get.containsKey('error')) {
            menungguErr.value = {'error': true};
          }
        } else {
          menungguData.value = get;
        }
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    }
  }

  void riwayatBayarVoid() async {
    try {
      if (authKey != null) {
        var get = await tagihanRepo.allTagihanTagihanFromSantri(this.authKey,
            status: 'sudah dibayar', payment_status: 'PAID');
        if (get is Map) {
          if (get.containsKey('error')) {
            riwayatErr.value = {'error': true};
          }
        } else {
          riwayatData.value = get;
        }
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    }
  }

  void createPayment(int tagihan_id) async {
    final messageError = 'Mohon maaf sistem sedang dalam perbaikan';
    isLoading.value = true;
    try {
      if (authKey != null) {
        var post = await tagihanRepo.createPayment(authKey, tagihan_id);
        if (post is Map) {
          if (post.containsKey('error')) {
            dialogCustom.dialogError(
                message: 'Tidak berhasil, Mohon ulangi lagi');
          }
        } else {
          if (post is CreatePaymentModels) {
            if (post.data!.paymentLink != null) {
              Get.toNamed(Routes.PAYMENT, arguments: post.data!.paymentLink);
            } else {
              dialogCustom.dialogError(message: messageError);
            }
          } else {
            dialogCustom.dialogError(message: messageError);
          }
        }
      }
    } catch (err) {
      dialogCustom.dialogError(message: messageError);
    } finally {
      isLoading.value = false;
    }
  }
}
