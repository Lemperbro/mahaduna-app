import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/app/data/wali_provider.dart';
import 'package:mahaduna_apps/app/models/wali/find_wali_model.dart';
import 'package:mahaduna_apps/app/models/wali/wali_login_model.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class WaliRepo extends GetxController {
  final WaliProvider waliProvider = WaliProvider();
  GetStorage getStorage = GetStorage('wali');
  late final authKey = getStorage.read('authKey');

  void onInit() {
    super.onInit();
  }

  Map errorHandle(String message) {
    Map<String, dynamic> error = {'error': 'true', 'message': message};
    return error;
  }

  void redirectToLogin(int? statusCode) {
    if (statusCode == 401) {
      if (this.authKey != null) {
        getStorage.remove('authKey');
        Get.offAllNamed(Routes.BOTTOM_NAVIGATE, arguments: {'index': 2});
      }
    }
  }

  Future waliLogin(String emailOrTelp, String password) async {
    try {
      var response = await waliProvider.waliLogin(emailOrTelp, password);
      if (response.statusCode == 200) {
        return waliLoginModelFromJson(response.bodyString!);
      } else if (response.statusCode == 422) {
        return errorHandle('Email / Nomor telphone atau password salah');
      } else {
        return errorHandle('tidak berhasil melakukan login');
      }
    } catch (err) {
      return errorHandle('tidak berhasil melakukan login');
    }
  }

  Future waliLogout(String authKey) async {
    try {
      var response = await waliProvider.waliLogout(authKey);
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 401) {
        redirectToLogin(response.statusCode);
      } else {
        return errorHandle('tidak berhasil melakukan logout');
      }
    } catch (err) {
      return errorHandle('tidak berhasil melakukan logout');
    }
  }

  Future findWali(String authKey, {bool? withSantri}) async {
    try {
      var response =
          await waliProvider.findWali(authKey, withSantri: withSantri);
      if (response.statusCode == 200) {
        var data = findWaliModelFromJson(response.bodyString!);
        return data;
      } else if (response.statusCode == 401) {
        redirectToLogin(response.statusCode);
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err) {
      return errorHandle('tidak berhasil mengambil data');
    }
  }
}
