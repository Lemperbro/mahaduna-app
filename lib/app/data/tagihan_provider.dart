import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class TagihanProvider extends GetConnect {
  late final String baseUrlBackend;
  TagihanProvider() {
    onInit();
  }

  @override
  void onInit() {
    baseUrlBackend = BaseUrlBackend.baseUrl;
    super.onInit();
    httpClient.timeout = Duration(seconds: 30);
  }

  Future<Response> allTagihanTagihanFromSantri(String authKey,
      {String status = 'belum dibayar',
      String payment_status = 'PENDING'}) async {
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authKey'
    };
    final Map<String, dynamic> queryParams = {
      'status': status,
      'payment_status': payment_status
    };
    return get('${baseUrlBackend}/tagihan/fromSantri',
        headers: headers, query: queryParams);
  }

  Future<Response> createPayment(String authKey, int tagihan_id) async {
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authKey'
    };

    return post('${baseUrlBackend}/tagihan/create-billing/${tagihan_id}', null,
        headers: headers);
  }
}
