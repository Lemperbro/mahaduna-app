import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class WaliProvider extends GetConnect {
  late final String baseUrlBackend;
  WaliProvider() {
    onInit();
  }

  @override
  void onInit() {
    baseUrlBackend = BaseUrlBackend.baseUrl;
    super.onInit();
    httpClient.timeout = Duration(seconds: 30);
  }

  Future<Response> waliLogin(String emailOrTelp, String password) async {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, String> body = {
      'emailOrTelp': emailOrTelp,
      'password': password
    };
    return post(
      '${baseUrlBackend}/wali/login',
      body,
      headers: headers,
    );
  }

  Future<Response> waliLogout(String authKey) async {
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authKey'
    };
    return post('${baseUrlBackend}/wali/logout', null, headers: headers);
  }

  Future<Response> findWali(String authKey, {bool? withSantri}) async {
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authKey'
    };
    final Map<String, dynamic> queryParams = {
      if (withSantri != null) 'withSantri': withSantri ? '1' : '0',
    };
    return get('${baseUrlBackend}/wali/findWali',
        headers: headers, query: queryParams);
  }
}
