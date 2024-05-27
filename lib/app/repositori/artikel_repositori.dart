import 'package:get/get.dart';
import 'package:mahaduna_apps/app/data/artikel_provider.dart';
import 'package:mahaduna_apps/app/models/artikel/all_kategori_artikel_model.dart';
import 'package:mahaduna_apps/app/models/artikel/artikel_all_model.dart';

class ArtikelRepo extends GetxController with StateMixin {
  final ArtikelProvider _artikelProvider = ArtikelProvider();

  void onInit() {
    super.onInit();
  }

  Map errorHandle(String message) {
    Map<String, dynamic> error = {'error': 'true', 'message': message};
    return error;
  }

  Future allArtikel(
      {String paginate = '10',
      dynamic keyword = null,
      bool? sortBest,
      String? kategori_id,
      int? page}) async {
    try {
      var value = await _artikelProvider.getAllArtikel(
          paginate: paginate,
          keyword: keyword,
          sortBest: sortBest,
          kategori_id: kategori_id,
          page: page);
      if (value.statusCode == 200) {
        var response = allArtikelModelFromJson(value.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('all Artikel Error1 ${err}');
      print('all Artikel Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }

  Future allArtikelKategori() async {
    try {
      var get = await _artikelProvider.allArtikelKategori();
      if (get.statusCode == 200) {
        var response = allKategoriArtikelModelFromJson(get.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('all kategori Error1 ${err}');
      print('all kategori Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }
}
