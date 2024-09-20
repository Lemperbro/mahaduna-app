import 'package:flutter/widgets.dart';
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

  final notShowPassword = true.obs;
  final notShowPasswordConfirmation = true.obs;
  final isLoadingSaveProfile = false.obs;

  final namaError = ''.obs;
  final emailError = ''.obs;
  final telpError = ''.obs;
  final alamatError = ''.obs;
  final passwordError = ''.obs;
  final passwordConfirmationError = ''.obs;

  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();

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

  void validateInputsProfile() {
    namaError.value = nama.text.isEmpty ? 'Nama harus diisi' : '';
    emailError.value = isValidEmail(email.text) ? '' : 'Email tidak valid';
    telpError.value = telp.text.isEmpty ? 'Telepon harus diisi' : '';
    alamatError.value = alamat.text.isEmpty ? 'Alamat harus diisi' : '';
    passwordError.value = password.text.isEmpty
        ? 'Password harus diisi'
        : (password.text.length < 8 ? 'Password harus minimal 8 karakter' : '');
    passwordConfirmationError.value =
        password.text != password_confirmation.text
            ? 'Password tidak sesuai'
            : '';
  }

  void resetFormState() {
    namaError.value = '';
    emailError.value = '';
    telpError.value = '';
    alamatError.value = '';
    passwordError.value = '';
    passwordConfirmationError.value = '';
    notShowPassword.value = true;
    notShowPasswordConfirmation.value = true;
    password.text = '';
    password_confirmation.text = '';
  }

  bool isValidEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  Future setValueFormProfile() async {
    if (waliData.value != null) {
      nama.text = waliData.value!.data!.nama!;
      email.text = waliData.value!.data!.email!;
      telp.text = waliData.value!.data!.telp!;
      alamat.text = waliData.value!.data!.alamat!;
    }
  }

  void saveProfile() {
    isLoadingSaveProfile.value = true;

    try {
      validateInputsProfile();
    } finally {
      isLoadingSaveProfile.value = false;
    }
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
