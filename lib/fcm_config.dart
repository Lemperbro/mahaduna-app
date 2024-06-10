import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/app/data/fcm_provider.dart';

class FcmConfig extends GetxController {
  final fcmProvider = Get.put(FcmProvider());
  GetStorage getStorage = GetStorage('notifToken');
  late final tokenStorage = getStorage.read('token');

  late final token;
  FcmConfig(String token) {
    this.token = token;
  }

  void saveToken() async {
    if (tokenStorage == null) {
      var save = await fcmProvider.saveToken(token);
      if (save.statusCode == 200) {
        getStorage.write('token', token);
      }
    }
  }
}
