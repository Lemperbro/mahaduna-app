import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/app/models/wali/find_wali_model.dart';
import 'package:mahaduna_apps/app/partials/dialog_custom.dart';
import 'package:mahaduna_apps/app/repositori/tagihan_repositori.dart';
import 'package:mahaduna_apps/app/repositori/wali_repositori.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class WaliController extends GetxController {
  GetStorage getStorage = GetStorage('wali');
  late final authKey = getStorage.read('authKey');
  final waliRepo = Get.put(WaliRepo());
  final tagihanRepo = Get.put(TagihanRepo());
  final dialogCustom = DialogCustom();

  final waliData = Rx<FindWaliModel?>(null);
  final waliDataErr = Rx<Map<String, dynamic>?>(null);

  final countTagihan = 0.obs;
  final countMenungguBayar = 0.obs;
  final isLogout = false.obs;

  @override
  void onInit() {
    if (authKey != null) {
      findWali();
      countTagihanVoid();
      countMenungguBayarVoid();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future refreshPage() async {
    waliData.value = null;
    findWali();
    countTagihanVoid();
    countMenungguBayarVoid();
  }

  void findWali() async {
    if (authKey != null) {
      try {
        var getData = await waliRepo.findWali(authKey, withSantri: true);
        if ((getData is Map)) {
          if (getData.containsKey('error')) {
            waliDataErr.value = {'error': true};
          }
        } else {
          waliData.value = getData;
        }
      } catch (err) {
        Get.snackbar('error', 'Ada kesalahan sistem');
      }
    }
  }

  void countTagihanVoid() async {
    try {
      if (authKey != null) {
        var get = await tagihanRepo.allTagihanTagihanFromSantri(authKey,
            status: 'belum dibayar');
        if (get is Map) {
          if (get.containsKey('error')) {
            countTagihan.value = 0;
          }
        } else {
          countTagihan.value = get.data.length;
        }
      } else {
        countTagihan.value = 0;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    }
  }

  void countMenungguBayarVoid() async {
    try {
      if (authKey != null) {
        var get = await tagihanRepo.allTagihanTagihanFromSantri(authKey,
            status: 'menunggu dibayar');
        if (get is Map) {
          if (get.containsKey('error')) {
            countMenungguBayar.value = 0;
          }
        } else {
          countMenungguBayar.value = get.data.length;
        }
      } else {
        countMenungguBayar.value = 0;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    }
  }

  void logout() async {
    isLogout.value = true;
    try {
      var logout = await waliRepo.waliLogout(authKey);
      if ((logout is Map)) {
        if (logout.containsKey('error')) {
          dialogCustom.dialogError(message: logout['message']);
        }
      } else if (logout) {
        getStorage.remove('authKey');
        Get.offAllNamed(Routes.BOTTOM_NAVIGATE, arguments: {'index': 2});
      } else {
        dialogCustom.dialogError(message: 'Tidak berhasil melakukan logout');
      }
    } catch (err) {
      dialogCustom.dialogError(message: 'Tidak berhasil melakukan logout');
    }
  }
}
