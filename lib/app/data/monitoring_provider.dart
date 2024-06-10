import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class MonitoringProvider extends GetConnect {
  late final String baseUrlBackend;
  MonitoringProvider() {
    onInit();
  }
  @override
  void onInit() {
    baseUrlBackend = BaseUrlBackend.baseUrl;
    super.onInit();
    httpClient.timeout = Duration(seconds: 30);
  }

  Future<Response> allMonitoring(String kategori, int santriId, String authKey,
      {int? paginate = 10, int? page}) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authKey'
    };
    final Map<String, dynamic> queryParams = {
      'kategori': kategori,
      'santriId': santriId.toString(),
      'paginate': paginate,
      if (page != null) 'page': page.toString()
    };

    return get('${baseUrlBackend}/monitoring/mingguan',
        headers: headers, query: queryParams);
  }

  Future<Response> allHafalan(int santriId, String authKey,
      {int? paginate = 10, int? page}) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $authKey'
    };
    final Map<String, dynamic> queryParams = {
      'santriId': santriId.toString(),
      'paginate': paginate,
      if (page != null) 'page': page.toString()
    };

    return get('${baseUrlBackend}/monitoring/hafalan',
        headers: headers, query: queryParams);
  }
}
