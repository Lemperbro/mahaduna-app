import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class StoreProvider extends GetConnect {
  late final String baseUrlBackend;
  StoreProvider() {
    onInit();
  }

  @override
  void onInit() {
    baseUrlBackend = BaseUrlBackend.baseUrl;
    super.onInit();
    httpClient.timeout = Duration(seconds: 30);
  }

  Future<Response> allProduk({String paginate = '6', int? page}) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, dynamic> queryParams = {
      'paginate': paginate,
      if (page != null) 'page': page.toString()
    };

    return get('${baseUrlBackend}/store/all',
        headers: headers, query: queryParams);
  }
}
