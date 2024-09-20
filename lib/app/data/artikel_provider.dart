import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class ArtikelProvider extends GetConnect {
  late final String baseUrlBackend;
  ArtikelProvider() {
    onInit();
  }
  @override
  void onInit() {
    baseUrlBackend = BaseUrlBackend.baseUrl;
    super.onInit();
    httpClient.timeout = Duration(seconds: 30);
  }

  Future<Response> getAllArtikel(
      {String paginate = '10',
      dynamic keyword = null,
      bool? sortBest,
      String? kategori_id,
      int? page}) {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, dynamic> queryParams = {
      if (keyword != null) 'keyword': keyword,
      'paginate': paginate,
      if (sortBest != null) 'sortBest': sortBest ? '1' : '0',
      if (kategori_id != null) 'kategori_id': kategori_id,
      if (page != null) 'page': page.toString()
    };

    var response = get(
      '${baseUrlBackend}/artikel/all',
      headers: headers,
      query: queryParams,
    );
    return response;
  }

  Future<Response> addViewer(String slug) {
    final Map<String, dynamic> queryParams = {'slug': slug};
    var response =
        get('${baseUrlBackend}/artikel/addViewer', query: queryParams);
    return response;
  }

  Future<Response> allArtikelKategori() {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };

    return get('${baseUrlBackend}/artikel/kategori/all', headers: headers);
  }
}
