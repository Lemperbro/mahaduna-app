import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class FcmProvider extends GetConnect {
  late final String baseUrlBackend;

  @override
  void onInit() {
    baseUrlBackend = BaseUrlBackend.baseUrl;
    super.onInit();
    httpClient.timeout = Duration(seconds: 30);
  }

  Future<Response> saveToken(String token) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, String> body = {'token': token};

    return post('${baseUrlBackend}/fcm/save', body, headers: headers);
  }
}
