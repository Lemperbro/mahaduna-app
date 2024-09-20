import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/fcm_config.dart';

class MainController extends GetxController {
  GetStorage getStorage = GetStorage('notifToken');

  @override
  void onInit() {
    super.onInit();
    saveDeviceToken();
    messageConfiguration();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void saveDeviceToken() async {
    String token = '';
    await FirebaseMessaging.instance.getToken().then((value) => token = value!);
    FcmConfig(token).saveToken();
  }

  void messageConfiguration() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }
}
