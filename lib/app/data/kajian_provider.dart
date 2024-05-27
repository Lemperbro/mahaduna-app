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

    httpClient.timeout = Duration(seconds: 30);
  }

  Future<Response> getAllKajian(
      {dynamic keyword = null, String paginate = '10', int page = 1}) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, dynamic> queryParams = {
      if (keyword != null) 'keyword': keyword,
      'paginate': paginate,
      'part': 'snippet,contentDetails',
      'page': page.toString()
    };
    var response = get(
      '$baseUrlBackend/playlist/all',
      headers: headers,
      query: queryParams,
    );
    return response;
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
    var response = get(
      '$baseUrlBackend/playlist/videos/all',
      headers: headers,
      query: queryParams,
    );
    return response;
  }

  Future<Response> findVideo(String videoId) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, dynamic> queryParams = {'videoId': videoId};

    var response = get(
      '${baseUrlBackend}/playlist/show/video',
      headers: headers,
      query: queryParams,
    );
    return response;
  }

  Future<Response> playlistItems(String playlistId,
      {dynamic pageToken = null}) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, dynamic> queryParams = {
      'playlistId': playlistId,
      if (pageToken != null) 'pageToken': pageToken
    };

    var response = get(
      '${baseUrlBackend}/playlist/items',
      headers: headers,
      query: queryParams,
    );
    return response;
  }
}
