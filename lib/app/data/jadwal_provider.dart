import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class JadwalProvider extends GetConnect {
  late final String baseUrlBackend;
  JadwalProvider() {
    onInit();
  }
  @override
  void onInit() {
    baseUrlBackend = BaseUrlBackend.baseUrl;
    super.onInit();
    httpClient.timeout = Duration(seconds: 30);
  }

  Future<Response> allJadwal() async {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    return get('${baseUrlBackend}/jadwal/santri', headers: headers);
  }
}
