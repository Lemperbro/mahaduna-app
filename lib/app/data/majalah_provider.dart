import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class MajalahProvider extends GetConnect {
  late final String baseUrlBackend;
  MajalahProvider() {
    onInit();
  }
  @override
  void onInit() {
    baseUrlBackend = BaseUrlBackend.baseUrl;
    super.onInit();
    httpClient.timeout = Duration(seconds: 30);
  }

  Future<Response> getAllMajalah({
    bool? sortBest,
    String paginate = '10',
    dynamic keyword = null,
  }) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, dynamic> queryParams = {
      if (keyword != null) 'keyword': keyword,
      'paginate': paginate,
      if (sortBest != null) 'sortBest': sortBest ? '1' : '0',
    };

    var response = get(
      '${baseUrlBackend}/majalah/all',
      query: queryParams,
      headers: headers,
    );
    return response;
  }
}
