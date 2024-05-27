import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/app/models/wali/wali_login_model.dart';
import 'package:mahaduna_apps/app/partials/dialog_custom.dart';
import 'package:mahaduna_apps/app/repositori/wali_repositori.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class LoginController extends GetxController {
  GetStorage getStorage = GetStorage('wali');
  final waliRepo = Get.put(WaliRepo());
  final dialogCustom = DialogCustom();

  TextEditingController emailOrTelpC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  final notShowPassword = true.obs;
  final isLoadingLogin = false.obs;

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
  }

  void login(String emailOrTelp, String password) async {
    try {
      if (isLoadingLogin.value == false) {
        isLoadingLogin.value = true;
        if (emailOrTelpC != '' && password != '') {
          String trimmedInput = emailOrTelp.trim();
          if (GetUtils.isEmail(trimmedInput) ||
              GetUtils.isPhoneNumber(trimmedInput)) {
            try {
              var login = await waliRepo.waliLogin(emailOrTelp, password);
              if (!(login is WaliLoginModel)) {
                if (login.containsKey('error')) {
                  dialogCustom.dialogError(message: login['message']);
                }
              } else {
                getStorage.write('authKey', login.data!.token);
                Get.offAllNamed(Routes.BOTTOM_NAVIGATE,
                    arguments: {'index': 2});
              }
            } catch (err) {
              dialogCustom.dialogError(
                  message: err.toString());
            }
          } else {
            dialogCustom.dialogError(
                message: 'Email atau Nomor telphone tidak valid');
          }
        } else {
          dialogCustom.dialogError(
              message: 'Email atau Nomor telphone dan password harus diisi');
        }
      }
    } finally {
      isLoadingLogin.value = false;
    }
  }
}
