import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class KajianProvider extends GetConnect {
  late final String baseUrlBackend;
  KajianProvider() {
    onInit();
  }
  @override
  void onInit() {
    baseUrlBackend = BaseUrlBackend.baseUrl;
    super.onInit();
  }

  Future<Response> getAllKajian(
      {dynamic keyword = null, String paginate = '10'}) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, dynamic> queryParams = {
      if (keyword != null) 'keyword': keyword,
      'paginate': paginate,
      'part': 'snippet,contentDetails'
    };
    return get(
      '$baseUrlBackend/playlist/all',
      headers: headers,
      query: queryParams,
    );
  }

  Future<Response> getAllLatestVideo(
      {String evenType = 'completed',
      String paginate = '10',
      dynamic pageToken = null}) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, dynamic> queryParams = {
      'evenType': evenType,
      'paginate': paginate,
      if (pageToken != null) 'pageToken': pageToken
    };
    return get(
      '$baseUrlBackend/playlist/videos/all',
      headers: headers,
      query: queryParams,
    );
  }
}
